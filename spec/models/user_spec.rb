require 'spec_helper'


describe User do
  context "follows or posts" do
    it "follow users or posts scraps" do
      user = User.create
      # comment1 = post.comment("first")
      # comment2 = post.comment("second")
      # post.reload.comments.should eq([comment2, comment1])
    end
  end
end