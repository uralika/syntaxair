# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    vote_number 1
    user nil
    scrap nil
  end
end
