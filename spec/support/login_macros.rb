module LoginMacros

  def sign_in(email, password)
    visit root_path
    click_link 'Log In'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log In'
  end
end
