require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    query = params.map{|k,v| "#{self.table_name}.#{k} = ?"}
    print  query.join(" AND ")
    print params.values
    # debugger
    abcd = DBConnection.execute(<<-SQL, params.values)
    select *
    from #{self.table_name}
    where #{query.join(" AND ")}
    SQL
    self.parse_all(abcd)
  end
end

class SQLObject
  extend Searchable
end
