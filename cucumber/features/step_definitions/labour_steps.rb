Given /^I have opened "([^\"]*)"$/ do |url|
  visit url
end

When /^I click the "([^\"]*)" link$/ do |title|
  click_link "#{title}"
end

Then /^the page should contain a button with alt text "([^\"]*)"$/ do |alt_text|
  response_body.should have_xpath("//input[@alt='#{alt_text}']")
end

