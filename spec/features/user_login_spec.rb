require 'rails_helper'
RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @correctUser = User.new
    @correctUser.name = "TestUser"
    @correctUser.email = "test@mail.com"
    @correctUser.password = 'test123'
    @correctUser.password_confirmation = 'test123'

    @correctUser.save
  end

  scenario 'They should see home page after valid user authentication' do

    visit root_path
    
    loginButton = page.find :link_or_button, 'Login'
    loginButton.click

    expect(page).to have_content("Email:")

    fill_in 'email', with: 'test@mail.com'
    fill_in 'password', with: 'test123'
    submitButton = page.find :link_or_button, 'Submit'
    submitButton.click

    expect(page).to have_content("Products")
    expect(page).to have_content("Signed in as")
  end
end