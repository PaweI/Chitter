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

Then(/^user should see the following form:$/) do |table|
  expect(page).to have_content("Enter your name")
  expect(page).to have_content("Enter your username")
  expect(page).to have_content("Enter your email")
  expect(page).to have_content("Enter your password")
  expect(page).to have_content("Type your password again")
end
