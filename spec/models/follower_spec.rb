require 'spec_helper'


describe Follower do
  context "follow users" do
    it "follows subscribers" do
      follower = Follower.create
      # comment1 = post.comment("first")
      # comment2 = post.comment("second")
      # post.reload.comments.should eq([comment2, comment1])
    end
  end
end