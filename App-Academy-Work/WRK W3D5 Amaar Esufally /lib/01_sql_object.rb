require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns_edit
    result = DBConnection.execute2(<<-SQL)
    SELECT *
    FROM #{self.table_name}
    SQL

    bob = []
    result[1..-1].each do |hash|
      sub = []
      hash.each do |k,v|
          sub << v
      end
      bob << sub
    end
    bob
  end


  def self.columns


    @result ||= DBConnection.execute2(<<-SQL)
    SELECT *
    FROM #{self.table_name}
    SQL


    a = @result.first
    a.map {|item| item.to_sym}


  end

  def self.finalize!

    columns.each do |item|
      define_method("#{item}") do
        attributes[item]
      end
      define_method("#{item}=") do |val|
        attributes[item] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name.tableize
  end

  def self.table_name
    if @table_name.nil?
      @table_name = self.to_s.tableize
    end
    @table_name
  end

  def self.all
    result = DBConnection.execute(<<-SQL)
    SELECT *
    FROM #{self.table_name}
    SQL

    self.parse_all(result)
  end

  def self.parse_all(results)
    results.map do |item|
      self.new item
    end
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL)
    SELECT *
    FROM #{self.table_name}
    WHERE #{self.table_name}.id = #{id}
    LIMIT 1
    SQL
    # debugger
    return nil if result.empty? || result == nil
    res = result.first
    # puts res
    self.new res

  end

  def initialize(params = {})
      params.each do |k,v|
        key = k.to_sym
        if self.class.columns.include?(key) == false
          raise "unknown attribute '#{k}'"
        else
          self.send("#{key}=",v)
        end
    end
  end

  def attributes
    # debugger
  @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map {|item| self.send(item)}
  end

  def insert
    c = self.class.columns
    l = c.length - 1
    cols = "(" + c[1..-1].join(",") + ")"
    q = []
    l.times do
      q << "?"
    end
    qmarks = "(" + q.join(",") + ")"

    xyz = attribute_values[1..-1]
    # debugger
    result = DBConnection.execute(<<-SQL, xyz)
      INSERT INTO
        #{self.class.table_name} #{cols}
      VALUES
        #{qmarks}
      SQL

    # debugger
    self.send("id=", DBConnection.last_insert_row_id)
    result

  end

  def update
  c = self.class.columns

  thing = c[1..-1].map do |col|
    "#{col} = ?"
  end
  thing2 = thing.join(",")
  thing3 = "id = ?"
  xyz = attribute_values[1..-1] << attribute_values[0]

    result = DBConnection.execute(<<-SQL, xyz)
    UPDATE
      #{self.class.table_name}
    SET
      #{thing2}
     WHERE
      #{thing3}
    SQL


  end

  def save
    result = self.id 
    if result.nil?
      self.insert
    else
      self.update
    end
  end
# SQLObject.finalize!
end
