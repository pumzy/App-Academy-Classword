FactoryGirl.define do
  factory :user do
    email "bob@gmail.com"
    password "ihatetesting"

    # Child of :post factory, since it's in the `factory :post` block
  
  end
end
