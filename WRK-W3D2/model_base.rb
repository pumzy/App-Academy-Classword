class ModelBase

  def initialize
    raise "Cannot initialize from ModelBase"
  end

  def self.find_by_id(id)
    table_name = ActiveSupport::Inflector.tableize(self)
    result = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM #{table_name}
      WHERE #{table_name}.id = ?
    SQL

   return nil if result.empty?
   self.class.new(result.first)
  end
end
