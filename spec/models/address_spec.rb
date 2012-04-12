require 'spec_helper'

describe Address do
  context "creating a new address" do
    describe "required fields" do
      it "requires street to be filled out" do
        address = Address.create
        address.should_not be_valid
        address.errors[:street].should_not be_empty
      end
      it "requires city to be filled out" do
        address = Address.create
        address.should_not be_valid
        address.errors[:city].should_not be_empty
      end
      it "requires zip to filled out" do
        address = Address.create
        address.should_not be_valid
        address.errors[:zip].should_not be_empty
      end
      
      it "zip must be numerical" do
        address = FactoryGirl.build :address, :zip => "nope"
        address.valid?.should be_false
        address.errors[:zip].should_not be_empty
      end
      
      it "state must be a valid state" do
        address = FactoryGirl.build :address, :state => "blarg"
        address.valid?.should be_false
        address.errors[:state].should_not be_empty
      end
    end
    it "must have a user" do 
      address = FactoryGirl.build :address
      address.should_not be_valid
      address.errors[:user].should_not be_empty
    end
  end
end
