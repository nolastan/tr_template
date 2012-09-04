require "spec_helper"

describe "POST tasks" do

  before :each do
    VCR.use_cassette "authentication/login_a_new_user" do
      Capybara.current_driver = :mechanize
      visit root_path
      click_on "Login"
      find(:css, "#switch-login a").click
      fill_in "user_session_email", :with => "roger@example.com"
      fill_in "user_session_password", :with => "secret"
      click_on "user_session_submit"
    end
  end

  it "should post with required fields", :vcr do
    expect{
      visit new_task_path
      fill_in "task_name", :with => "House Chores"
      fill_in "task_named_price", :with => "50"
      fill_in "task_city_id", :with => "4"
      page.find('.actions input').click
      page.should have_content "Task Posted"
    }.to change(Task, :count).by 1
    Task.last.name.should == "House Chores"
    Task.last.remote_id.should_not be_nil
  end

  it "should not post without required fields", :vcr do
    expect{
      visit new_task_path
      fill_in "task_name", :with => ""
      fill_in "task_named_price", :with => "50"
      fill_in "task_city_id", :with => "4"
      page.find('.actions input').click
    }.to change(Task, :count).by 0
  end

  it "should post with a location" do

  end

  it "should post with a sound" do

  end

  it "should post with an image" do

  end
end

describe "GET tasks#show" do

  it "should show the location" do

  end

  it "should show the complete by time" do

  end

  it "should show the assign by time" do

  end

  it "should show the state" do

  end

  it "should show the user" do

  end

  it "should link to the Task page on TaskRabbit" do

  end

end

describe "PUT tasks#close" do
  it "should close the task" do

  end
end

describe "PUT tasks#cancel" do
  it "should cancel the task" do

  end
end

describe "PUT tasks" do
  it "should update the task" do

  end
end