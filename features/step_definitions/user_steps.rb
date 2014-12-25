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
  expect(page).to have_selector("input[placeholder='Name']")
  expect(page).to have_selector("input[placeholder='Username']")
  expect(page).to have_selector("input[placeholder='Email']")
  expect(page).to have_selector("input[placeholder='Password']")
  expect(page).to have_selector("input[placeholder='Repeat password']")
end
