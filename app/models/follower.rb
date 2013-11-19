class Follower < ActiveRecord::Base
  belongs_to :i_follow, class_name:'User', inverse_of: :follows_mes
  belongs_to :follows_me, class_name:'User', inverse_of: :i_follows
end
