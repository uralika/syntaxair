require 'spec_helper'


describe Scrap do
  context "create scrap" do
    it "makes new scraps" do
      scrap = Scrap.create
      # comment1 = post.comment("first")
      # comment2 = post.comment("second")
      # post.reload.comments.should eq([comment2, comment1])
    end
  end
end