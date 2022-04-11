require "rails_helper"

RSpec.feature "Widget management", :type => :feature do
  describe "User creates a new widget" do
    it "visits the page" do
      visit "https://snap.modernemortgage.com/home/mobile-test"
      binding.pry
    end
  end
end