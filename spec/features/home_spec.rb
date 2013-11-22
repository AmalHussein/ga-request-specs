require 'spec_helper'

feature 'Home/Root page' do
  scenario "without users" do
    visit root_url
    current_path.should == root_path
    find_link 'Sign up'
    find_link 'Log In'
    find_link 'New Playlist'
    # save_and_open_page
  end

  scenario 'with users that have playlists' do
    create_users
    visit root_url
    find_link 'Sign up'
    find_link 'rock'
    find_link 'country'
    find_link 'New Playlist'
    # save_and_open_page
  end

  scenario "with a logged in user" do
    create_users
    sign_in('foo@example.com', 'foo')
    current_path.should == root_path
    # save_and_open_page
  end
end


