require 'spec_helper'

describe User do

  before(:each) do
    @user = FactoryGirl.build(:user)
  end

  it "should have an new_email field" do
    @user.should respond_to(:new_email)
  end

  it "should have an new_email_token field" do
    @user.should respond_to(:new_email_token)
  end

  it "email address should be unique" do
    same_email = 'foo@bar.org'

    @user.email = same_email
    @user.confirmed = Time.now
    @user.save

    @other_user = FactoryGirl.build( :user, :username => "this-is-a-unique-username", :email => same_email )
    @other_user.should_not be_valid

    @other_user.email = 'foo@otherbar.org'
    @other_user.should be_valid
  end

end
