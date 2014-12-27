When(/^open main page$/) do
  visit '/'
end

When(/^fill peep box and click PEEP$/) do
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