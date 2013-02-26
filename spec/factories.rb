# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email    "test@example.com"
    password "foobar"
    password_confirmation "foobar"
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
    # factory :admin do
   #    after(:create) {|user| user.add_role(:admin)}
   #  end
  end
  factory :place do
    name  "Restaurant"
    instagram_tag "localmissioneatery"
    user
  end
  factory :menu do
    name  "Brunch"
    place
  end
  factory :dish do
    name  "Omelette"
    description "Three Egg Omelet with the seasons best fresh ingredients"
    price "9"
    menu
  end
end

