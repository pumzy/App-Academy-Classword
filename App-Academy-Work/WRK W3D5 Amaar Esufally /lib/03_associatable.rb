require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'
# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    
  end

  def table_name
    # ...
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    default = {:foreign_key => "#{name.singularize}_id".to_sym,
               :primary_key => "id".to_sym,
               :class_name => "#{name.camelcase}"  }

    default.keys.each do |key|
      send("#{key}=", options[key] || default[key])


    end










  #   unless options.empty?
  #   debugger
  #   if options[:foreign_key].nil?
  #     @foreign_key = options.first.to_s.gsub(/\s+/, "_")
  #      options.define_method(foreign_key) { return options.first.to_s.gsub(/\s+/, "_") }
  #   else
  #     @foreign_key = options[:foreign_key]
  #   end
  #   if options[:primary_key].nil?
  #     @primary_key = "id"
  #     options.define_method(primary_key) {return "id"}
  #   else
  #     @primary_key = options[:primary_key]
  #   end
  #   if options[:class_name].nil?
  #     @class_name = options.first.to_s.camelcase
  #     options.define_method(class_name) {return options.first.to_s.camelcase}
  #   else
  #     @class_name = options[:class_name]
  #   end
  # end
end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    default = {:foreign_key => "#{self_class_name.underscore}_id".to_sym,
               :primary_key => "id".to_sym,
               :class_name => "#{name.singularize.camelcase}"  }

    default.keys.each do |key|
      send("#{key}=", options[key] || default[key])
    end


  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    if options.nil?
      options = BelongsToOptions.new(name)
    else
      options = BelongsToOptions.new(name,options)
    end


  define_method(parent) do
  a = options.send(:foreign_key)
  c = options.send(:class_name)



  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
