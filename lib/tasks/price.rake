namespace :price do
  desc "Calculate prices given a list of items"
  task calculate: :environment do
  	puts Price.new(["milk","milk","milk"]).calculate
  end
end
