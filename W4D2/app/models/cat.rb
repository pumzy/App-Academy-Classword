class Cat < ActiveRecord::Base
   validates_presence_of Cat.attribute_names - ["id", "created_at", "updated_at"]
   validates_inclusion_of :color, :in =>   %w(blue red green black yellow orange white coal brown teal magenta turquoise)
   validates_inclusion_of :sex, :in => %w(M F)

  has_many :cat_rental_requests,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy

  def self.colors
    %w(blue red green black yellow orange white coal brown teal magenta turquoise)
  end

   def age
     Date.today.year - self.birth_date.year
   end
end
