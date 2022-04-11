require 'selenium-webdriver'
require 'webdrivers'
require 'pry'

driver = Selenium::WebDriver.for :chrome

driver.get "https://snap.modernemortgage.com/home/mobile-test"

email = driver.find_element(:partial_link_text, '@').text
binding.pry
unless email.nil?
	email_text = email.text
	puts "Success email found: #{email_text}"
else
	puts "Failed no email found"
end

driver.get "https://admin1.himaxwelldemo.com/loan_applications/new?share_token=2530-ce48674a-d0a2-49eb-ae16-e37c08bcf977"

binding.pry