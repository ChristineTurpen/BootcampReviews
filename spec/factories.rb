FactoryBot.define do

  factory :user do
    sequence :email do |n|
       "dummyEmail#{n}@gmail.com" 
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end
  
  factory :bootcamp do
    name { "hello" }
    university { "UC Berkeley" }
    description { "lol" }
    association :user
  end
end