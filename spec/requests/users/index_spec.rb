require 'spec_helper'

describe 'index actions' do 
  before do 
    @joe = FactoryGirl.create(:user)
    
    # load homepage
    visit users_path
    
        
    # fill in email/password
    #fill_in("Email", :with => @joe.email)
    #fill_in("Password", :with => @joe.password)
    
    # click sign in button
    #click_button "Sign in"
        
  end
  
  it 'lets you edit a user' do
    click_link 'Edit'
    current_path.should == edit_user_path(@joe)
  end  
  
  
  
  
end