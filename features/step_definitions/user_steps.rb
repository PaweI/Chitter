When(/^opening main page$/) do
  visit('/')
end

When(/^user not logged in$/) do
  expect(page).not_to have_content("Log out")
end

Then(/^user should see link Sign up$/) do
  expect(page).to have_content("Sign up")
end

When(/^open home page and click on Sign up$/) do
  visit('/')
  click_on ('Sign up')
end

And(/^user should see the following form:$/) do |table|
  expect(page).to have_selector("input[placeholder='Name']")
  expect(page).to have_selector("input[placeholder='Username']")
  expect(page).to have_selector("input[placeholder='Email']")
  expect(page).to have_selector("input[placeholder='Password']")
  expect(page).to have_selector("input[placeholder='Confirm password']")
end

Then(/^fill that form and click Sign up$/) do
  fill_in 'name', with: "Samuel Russell Hampden Joseph"
  fill_in 'username', with: "tansaku"
  fill_in 'email', with: "sam@makersacademy.com"
  fill_in 'password', with: "testtest"
  fill_in 'password_confirmation', with: "testtest"
  click_on "Sign up"
end

Then(/^User should see homepage with welcome message$/) do
  expect(page).to have_content('Welcome, tansaku')
end
