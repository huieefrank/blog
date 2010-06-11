require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :email => "value for email",
      :encrypted_password => "value for encrypted_password",
      :salt => "value for salt",
      :remember_token => "value for remember_token"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
