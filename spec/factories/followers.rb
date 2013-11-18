# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :follower do
    i_follow_id 1
    follows_me_id 1
  end
end
