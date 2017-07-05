class Questions
  attr_accessor :title, :body, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map {|question| Questions.new(question)}
  end

  def self.find_by_id(id)
     result = QuestionsDatabase.instance.execute(<<-SQL, id)
       SELECT *
       FROM questions
       WHERE questions.id = ?
     SQL

    return nil if result.empty?
    Questions.new(result.first)
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT *
    FROM questions
    WHERE questions.user_id = ?
    SQL

    return nil if data.empty?
    data.map { |question| Questions.new(question) }
  end

  def self.most_liked(n)
    QuestionLikes.most_liked_questions(n)
  end

  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    Users.find_by_id(@user_id)
  end

  def replies
    Replies.find_by_question_id(@id)
  end

  def followers
    QuestionFollows.followers_for_each_question(@id)
  end


  def likers
    QuestionLikes.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(@id)
  end

  def save
    if @id
      update
      return
    end
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO
        questions (title, body, user_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, user_id = ?
      WHERE
        id = ?
    SQL
  end
end
