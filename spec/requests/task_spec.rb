require "spec_helper"

describe "POST tasks" do
  it "should post with required fields", :vcr do
    expect{
      visit new_task_path
      fill_in "task_name", :with => "House Chores"
      fill_in "named_price", :with => "50"
      fill_in "city_id", :with => "4"
      click_on "task_submit"
      page.should have_content "Task Posted"
    }.to change(Task, :count).by 1
    Task.last.name.should_be "House Chores"
    Task.last.remote_id.should_be not_nil
    Task.last.remote_url.should_be not_nil
  end

  it "should not post without required fields", :vcr do
    expect{
      visit new_task_path
      fill_in "task_name", :with => ""
      fill_in "named_price", :with => "50"
      fill_in "city_id", :with => "4"
      click_on "task_submit"
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