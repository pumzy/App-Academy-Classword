class QuestionFollows
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map {|follow| QuestionFollows.new(follow)}
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
     result = QuestionsDatabase.instance.execute(<<-SQL, id)
       SELECT *
       FROM question_follows
       WHERE question_follows.id = ?
     SQL

    return nil if result.empty?
    QuestionFollows.new(result.first)
  end

  def self.followers_for_each_question(q_id)
    data = QuestionsDatabase.instance.execute(<<~SQL, q_id)
    SELECT
      users.*
    FROM
      question_follows
      JOIN users
        ON question_follows.user_id = users.id
    WHERE
      question_id = ?
    SQL

    return nil if data.empty?
    data.map { |reply| Users.new(reply) }
  end


  def self.followed_questions_for_user_id(u_id)
    data = QuestionsDatabase.instance.execute(<<~SQL, u_id)
    SELECT
      questions.*
    FROM
      question_follows
      JOIN questions
        ON question_follows.question_id = questions.id
    WHERE
      question_follows.user_id = ?
    SQL

    return nil if data.empty?
    data.map { |reply| Questions.new(reply) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<~SQL, n)
    SELECT
      questions.*
    FROM
      question_follows
      JOIN questions
        ON question_follows.question_id = questions.id
    GROUP BY
      question_follows.question_id
    ORDER BY
      COUNT(question_follows.user_id) DESC
    LIMIT ?
    SQL

    return nil if data.empty?
    data.map { |reply| Questions.new(reply) }
  end



end
