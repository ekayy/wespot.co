def login(user)
  visit user_session_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Login"
end