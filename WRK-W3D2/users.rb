# require_relative 'run.rb'

class Users
  attr_accessor :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map {|user| Users.new(user)}
  end


  def self.find_by_id(id)
     return nil unless id
     result = QuestionsDatabase.instance.execute(<<-SQL, id)
       SELECT *
       FROM users
       WHERE users.id = ?
     SQL

    return nil if result.empty?
    Users.new(result.first)

  end

  def self.find_by_name(fname,lname)
    #  return nil unless fname
     result = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
       SELECT *
       FROM users
       WHERE users.fname = ? AND users.lname = ?
     SQL

    return nil if result.empty?
    Users.new(result.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Questions.find_by_author_id(@id)
  end

  def authored_replies
    Replies.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLikes.liked_questions_for_user_id(@id)
  end

  def average_karma
    avg_karma = QuestionsDatabase.instance.execute(<<-SQL, @id, @id)
      SELECT CAST (COUNT(*) AS FLOAT) / (
        SELECT
          COUNT(*)
        FROM
          questions
        WHERE
          questions.user_id = ?
        GROUP BY
          questions.user_id )
      FROM
        questions
      LEFT OUTER JOIN
        question_likes
        ON questions.id = question_likes.question_id
      WHERE
        questions.user_id = ?
    SQL
    avg_karma.first.values.first
  end


  def save
    if @id
      update
      return
    end
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end

end
