require 'rails_helper'

describe 'test images on user profile page' do
  it 'show image' do
    user = FactoryBot.create(:user)
    image = FactoryBot.create(:image)
    visit new_user_session_url
    fill_in 'Username', :with => 'user'
    fill_in 'Password', :with => 'password'
    click_button 'Log in'
    visit profile_url(user)
    expect(page).to have_content "A beutiful Rails Logo"
  end
end
