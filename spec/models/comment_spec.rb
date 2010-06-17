require 'spec_helper'

describe Comment do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :content => "value for content",
      :email => "value for email",
      :site_url => "value for site_url"
    }
  end

  it "should create a new instance given valid attributes" do
    Comment.create!(@valid_attributes)
  end
end
