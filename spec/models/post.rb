require 'spec_helper'

describe Post do
  context "Valid Post" do
    before(:each) do
      @post = Factory.build(:post)
    end

    it "should be valid with minimum attributes" do
      @post.should be_valid
    end

  end

end
