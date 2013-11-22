require 'spec_helper'

feature "Login" do

  scenario 'New user' do
    create_users
    
    visit root_path
    click_link('Log In')

    # Now on login page
    current_path.should == log_in_path
    # should have fields to enter an email and password
    # fill em in
    fill_in('Email', with: "foo@example.com" )
    fill_in('Password', with: "foo" )
    click_on('Log In')

    # Now on the root page and foo is logged in!
    current_path.should == root_path

    page.should have_content('Logged in as foo@example.com')
    # save_and_open_page    
  end

end
