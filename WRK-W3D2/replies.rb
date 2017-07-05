class Replies
  attr_accessor :question_id, :user_id, :parent_id, :body

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |reply| Replies.new( reply ) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
    @body = options['body']
  end

  def self.find_by_id(id)
     result = QuestionsDatabase.instance.execute(<<-SQL, id)
       SELECT *
       FROM replies
       WHERE replies.id = ?
     SQL

    return nil if result.empty?
    Replies.new(result.first)
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT *
    FROM replies
    WHERE replies.user_id = ?
    SQL

    return nil if data.empty?
    data.map { |reply| Replies.new(reply) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT *
    FROM replies
    WHERE replies.question_id = ?
    SQL

    return nil if data.empty?
    data.map { |reply| Replies.new(reply) }
  end

  def author
    Users.find_by_id(@user_id)
  end

  def question
    Questions.find_by_id(@question_id)
  end

  def parent_reply
    Replies.find_by_id(@parent_id)
  end

  def child_reply
    data = QuestionsDatabase.instance.execute(<<~SQL, @id)
    SELECT *
    FROM replies
    WHERE replies.parent_id = ?
    SQL

    return nil if data.empty?
    data.map { |reply| Replies.new(reply) }
  end

  def save
     if @id
       update
       return
     end
    QuestionsDatabase.instance.execute(<<-SQL, @question_id, @user_id, @parent_id, @body)
      INSERT INTO
        replies (question_id, user_id, parent_id, body)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @question_id, @user_id, @parent_id, @body, @id)
      UPDATE
        replies
      SET
        question_id = ?, user_id = ?, parent_id = ?, body = ?
      WHERE
        id = ?
    SQL
  end

end
