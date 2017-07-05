class QuestionLikes < ModelBase
  attr_accessor :question_like, :user_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map {|question| QuestionLikes.new(question)}
  end

  def initialize(options)
    @id = options['id']
    @question_like = options['question_like']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
     result = QuestionsDatabase.instance.execute(<<-SQL, id)
       SELECT *
       FROM question_likes
       WHERE question_likes.id = ?
     SQL

    return nil if result.empty?
    QuestionLikes.new(result.first)
  end

  def self.likers_for_question_id(q_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, q_id)
      SELECT
        users.*
      FROM
        question_likes
      JOIN
        users
        ON question_likes.user_id = users.id
      WHERE
        question_likes.question_like = 1 AND question_likes.question_id = ?
    SQL
    return nil if data.empty?
    data.map { |user| Users.new(user) }
  end

  def self.num_likes_for_question_id(q_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, q_id)
      SELECT
        COUNT(users.id)
      FROM
        question_likes
      JOIN
        users
        ON question_likes.user_id = users.id
      WHERE
        question_likes.question_like = 1 AND question_likes.question_id = ?
      GROUP BY
        question_likes.question_id
    SQL
    data.first.values.first
  end

  def self.liked_questions_for_user_id(u_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, u_id)
      SELECT
        questions.*
      FROM
        question_likes
      JOIN
        questions
        ON question_likes.question_id = questions.id
      WHERE
        question_likes.question_like = 1 AND question_likes.user_id = ?
    SQL
    return nil if data.empty?
    data.map { |user| Questions.new(user) }
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<~SQL, n)
    SELECT
      questions.*
    FROM
      question_likes
      JOIN questions
        ON question_likes.question_id = questions.id
    GROUP BY
      question_likes.question_id
    ORDER BY
      COUNT(question_likes.user_id) DESC
    LIMIT ?
    SQL

    return nil if data.empty?
    data.map { |reply| Questions.new(reply) }
  end
end
