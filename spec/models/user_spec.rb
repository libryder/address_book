require 'spec_helper'

describe User do
  it "must have a first name" do 
    u = User.create 
    u.should_not be_valid
    u.errors[:first_name].should_not be_empty
  end
  
  it "must have a last name" do
    u = User.create
    u.should_not be_valid
    u.errors[:last_name].should_not be_empty
  end
  
  it "can create an address through a user" do
    u = FactoryGirl.create :user
    u.valid?.should be_true
    u.addresses.build.should_not be_nil
  end
  
  it "can have multiple addresses" do
    
  end
  
end