def create_user
  visit '/'
  click_on "Sign up"
  fill_in 'name', with: "Samuel Russell Hampden Joseph"
  fill_in 'username', with: "tansaku"
  fill_in 'email', with: "sam@makersacademy.com"
  fill_in 'password', with: "testtest"
  fill_in 'password_confirmation', with: "testtest"
  click_on "Sign up"
end

def create_peeps
  create_user
  fill_in 'peep', with: "Hello World"
  click_on 'PEEP'
  fill_in 'peep', with: "Show must go on"
  click_on 'PEEP'
  fill_in 'peep', with: "Here we are, born to be Kings with.."
  click_on 'PEEP'
end

When(/^open main page$/) do
  visit '/'
end

When(/^fill peep box and click PEEP$/) do
  create_user
  fill_in 'peep', with: "Dream on, dream on.."
  click_on 'PEEP'
end

Then(/^should see peep on a page$/) do
  expect(page).to have_content "Dream on, dream on.."
end

When(/^click peep$/) do
  fill_in 'peep', with: "Dream on, dream on.."
  click_on 'PEEP'
end

Then(/^should see error$/) do
  expect(page).to have_content "You can not Peep when not logged in"
end

Then(/^should see a peep$/) do
  create_user
  fill_in 'peep', with: "Dream on, dream on.."
  click_on 'PEEP'
  click_on 'Log out'
  expect(page).to have_content "Dream on, dream on.."
end

When(/^create (\d+) peeps$/) do |arg1|
  create_user
  fill_in 'peep', with: "Hello World"
  click_on 'PEEP'
  fill_in 'peep', with: "Show must go on"
  click_on 'PEEP'
  fill_in 'peep', with: "Here we are, born to be Kings with.."
  click_on 'PEEP'
end

Then(/^should see LAST peep first and so on up to the first one$/) do
  expect(page).to have_selector("ul li:nth-child(1)", text: "Here we are, born to be Kings with..")
  expect(page).to have_selector("ul li:nth-child(2)", text: "Show must go on")
  expect(page).to have_selector("ul li:nth-child(3)", text: "Hello World")
end