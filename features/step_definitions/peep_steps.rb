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