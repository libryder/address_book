require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "GET 'new'" do
    it 'responds with success' do
      get :new
      response.should be_success
    end
    
    it 'displays the "new" form do' do
      get :new
      response.should render_template("new")
    end
    
    it 'assigns @user' do
      get :new
      assigns(:user).should be_instance_of User
    end
    
  end

  describe "POST 'create'" do
    
    describe "when data is valid" do
      it 'saves the user' do
        
        expect { 
          post :create, { :user => { :first_name => "Joe", :last_name => "Smith" } }
        }.to change{User.count}.by(1)
      end
      
      it 'redirects to the show page' do
        post :create, { :user => { :first_name => "Joe", :last_name => "Smith" } }
        response.should redirect_to user_path User.last.id
      end
    end
    
    describe "when data is invalid" do
      it 'does not save the user' do
        expect {
          post :create, :user => {}
        }.to_not change { User.count }
      end
      
      it 'returns  to the "new" page' do
        post :create, :user => {}
        response.should render_template "new"
      end
      
    end    
      
  end
  
  describe 'GET "show"' do
    before do
      @user = FactoryGirl.create :user
    end
    
    it 'sets @user' do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    
    it 'renders "SHOW" template' do 
      get :show, :id => @user.id
      response.should render_template 'show'
    end
  end
  
  describe 'GET "edit"' do 
    before do
      @user = FactoryGirl.create :user
    end 
  
    it 'renders the edit form' do 
      get :edit, :id => @user.id
      response.should render_template 'edit'
      
    end
    
    it 'sets @user' do 
      get :edit, :id => @user.id
      assigns(:user).should == @user
    end
  end
  
  describe 'PUT "update"' do
    before do
      @user = FactoryGirl.create :user
    end 
    
    describe "when data is valid" do
      it 'updates the user' do
        
        expect { 
          put :update, :id => @user.id, :user => { :first_name => "John", :last_name => "Galt" }
        }.to change{@user.reload.first_name}.to("John")
      end
      
      it 'redirects to the show page' do
        put :update, :id => @user.id, :user => { :first_name => "John", :last_name => "Galt" }
        response.should redirect_to user_path @user.id
      end
    end
    
    describe "when data is invalid" do
      it 'does not save the user' do
        expect {
          put :update, :id => @user.id, :user => { :first_name => '' }
        }.to_not change { @user.first_name }
      end
      
      it 'returns  to the "edit" page' do
        put :update, :id => @user.id, :user => { :first_name => '' }
        response.should render_template "edit"
      end
            
    end
    
  end
  
  describe "DELETE user" do
    before do
      @user = FactoryGirl.create :user
    end 
    
    it 'deletes the user' do
      expect { 
        delete :destroy, :id => @user.id
      }.to change { User.count }.by(-1)
      response.should redirect_to users_path
      
    end
  end

end
