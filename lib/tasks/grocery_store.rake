namespace :grocery_store do
  desc "Calculate prices at a grocery store given a list of items"
  task calculate_price: :environment do
  	co = Checkout.new("milk,milk,bread,banana,bread,bread,bread,milk,apple")
  	binding.pry
  end
end
