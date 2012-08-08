require 'spec_helper'

describe 'Tasks' do
  it "should post to the API" do
    user = FactoryGirl.create(:user)
    visit 'tasks/new'
    fill_in "Name", :with => "My new task"
  end
end