require 'spec_helper'

describe TasksController do
  integrate_views
  fixtures :tasks
  
  describe "GET #index" do
    it "should be visible by everyone" do
      get :index
      response.code.should == '200'
    end
  end

  describe "GET #new" do
    it "should not be visible by logged out users" do
      get :new
      response.should redirect_to :root
    end
  end

  describe "POST #create" do
    it "should be visible by everyone" do
      post :create
      response.code.should == '200'
    end
  end

end