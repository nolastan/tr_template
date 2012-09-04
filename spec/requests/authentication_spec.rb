require "spec_helper"

describe "Authentication" do
  before :each do
    Capybara.current_driver = :mechanize
  end

  it "login a new user", :vcr do
    visit root_path
    click_on "Login"

    fill_in "user_first_and_last_name", :with => "Roger Rabbit"
    fill_in "user_zip_code", :with => "12345"
    fill_in "user_email", :with => "roger@example.com"
    fill_in "user_mobile_phone", :with => "012-345-6789"
    fill_in "user_password", :with => "secret"
    click_on "user_submit"

    page.should have_content "Billing"

    fill_in "stored_card_card_number", :with => "4111 1111 1111 1111"
    fill_in "stored_card_postal_code", :with => "12345"
    fill_in "stored_card_cvv", :with => "123"
    select (Time.new.year.to_i + 1).to_s, :from => "stored_card_card_expires_on_1i"
    click_on "stored_card_submit"

    current_url.should == root_url
    page.should have_content "Roger R."
  end

  it "login existing user", :vcr do
    visit root_path
    click_on "Login"
    find(:css, "#switch-login a").click
    fill_in "user_session_email", :with => "roger@example.com"
    fill_in "user_session_password", :with => "secret"
    click_on "user_session_submit"

    current_url.should == root_url
    page.should have_content "Roger R."
  end
end