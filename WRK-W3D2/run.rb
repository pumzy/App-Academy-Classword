require 'Singleton'
require 'SQLite3'
require 'active_support/inflector'
require_relative 'model_base.rb'
require_relative 'users.rb'
require_relative 'questions.rb'
require_relative 'question_likes.rb'
require_relative 'replies.rb'
require_relative 'question_follows.rb'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super("questions.db")
    self.type_translation = true
    self.results_as_hash = true
  end
end
