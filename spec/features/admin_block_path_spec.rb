require 'rails_helper'

describe 'test for admin route block' do
  it 'will allow if admin' do
    FactoryBot.create(:admin)
    visit new_user_session_url
    fill_in 'Username', :with => 'admin'
    fill_in 'Password', :with => 'password1'
    click_button 'Log in'
    visit rails_admin_url
    expect(page).not_to have_content "Newest images"
  end
end
