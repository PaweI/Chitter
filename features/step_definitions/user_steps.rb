def create_user
  visit '/'
  click_on 'Sign up'
  fill_in 'name', with: 'Samuel Russell Hampden Joseph'
  fill_in 'username', with: 'tansaku'
  fill_in 'email', with: 'sam@makersacademy.com'
  fill_in 'password', with: 'testtest'
  fill_in 'password_confirmation', with: 'testtest'
  click_button 'Sign up'
end

When(/^opening main page$/) do
  visit '/'
end

When(/^user not logged in$/) do
  expect(page).not_to have_content 'Log out'
end

Then(/^user should see link Sign up$/) do
  expect(page).to have_content 'Sign up'
end

When(/^open home page and click on Sign up$/) do
  visit '/'
  click_on 'Sign up'
end

And(/^user should see the following form:$/) do |_table|
  expect(page).to have_selector 'input[placeholder="Name"]'
  expect(page).to have_selector 'input[placeholder="Username"]'
  expect(page).to have_selector 'input[placeholder="Email"]'
  expect(page).to have_selector 'input[placeholder="Password"]'
  expect(page).to have_selector 'input[placeholder="Confirm password"]'
end

Then(/^fill that form and click Sign up$/) do
  create_user
end

Then(/^User should see homepage with welcome message$/) do
  expect(page).to have_content('Welcome, tansaku')
end

When(/^User fill username already been taken$/) do
  visit '/users/new'
  create_user
  click_on 'Log out'
  click_on 'Sign up'
  fill_in 'name', with: 'Samuel Russell Hampden Joseph'
  fill_in 'username', with: 'tansaku'
end

Then(/^User fill email already been taken$/) do
  fill_in 'email', with: 'sam@makersacademy.com'
end

Then(/^User fill wrong password confirmation and click on Sign up$/) do
  fill_in 'password', with: 'testtest'
  fill_in 'password_confirmation', with: 'test'
  click_button 'Sign up'
end

Then(/^should see list of error messages$/) do
  expect(page).to have_content 'Your passwords don\'t match'
  expect(page).to have_content 'Username already taken'
  expect(page).to have_content 'Email already taken'
end

When(/^user logged in$/) do
  visit '/'
  click_on 'Sign up'
  create_user
  expect(page).to have_button 'Log out'
end

Then(/^can log out$/) do
  click_on 'Log out'
end

Then(/^should see Good bye message$/) do
  expect(page).to have_content 'See you again soon'
end

When(/^no user logged$/) do
  create_user
  click_on 'Log out'
  expect(page).not_to have_content 'Welcome'
end

Then(/^can enter loggin details$/) do
  click_on 'Log in'
  fill_in 'Email', with: 'sam@makersacademy.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end

Then(/^should see Welcome message$/) do
  expect(page).to have_content 'Welcome'
end
