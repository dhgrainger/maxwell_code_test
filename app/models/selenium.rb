require 'selenium-webdriver'
require 'webdrivers'
require 'pry'

driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = 3000

driver.get "https://snap.modernemortgage.com/home/mobile-test"

email = driver.find_element(:partial_link_text, '@')

unless email.text.nil?
	email_text = email.text
	puts "Success email found: #{email_text}"
else
	puts "Failed no email found"
end

# driver.find_element(:partial_link_text, 'Apply Now').click
driver.get "https://admin1.himaxwelldemo.com/loan_applications/new?share_token=2530-ce48674a-d0a2-49eb-ae16-e37c08bcf977"

email2 = driver.find_element(:partial_link_text, '@').text

if email_text == email2
	puts "Success emails match" 
else
	puts "Unsuccessful"
end

