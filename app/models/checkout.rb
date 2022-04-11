class Checkout
	attr_reader :items
	def initialize(item_string)
		@items = items_hash(item_string)
	end 

	def items_hash(item_string)
		item_array = item_string.split(',')
		item_array.uniq.each_with_object({}) do |item, item_hash|
			quantity = item_array.count(item)
			item_hash[item.to_sym] = {
				quantity: item_array.count(item),
				price: Price.new(item.to_sym,quantity).calculate
			}
		end
	end

	def total
		items.map{|item,info| info[:price]}.reduce(:+)
	end

	def total_without_savings
		items.map do |item,info|
			 Price.new(item.to_sym,info[:quantity]).unit_total(info[:quantity])
		end.reduce(:+)
	end

	def savings
		total - total_without_savings
	end

	def to_money(amount)
		"$#{amount.round(2)}"
	end

	def display
		puts "Item   Quantity   Price"
		items.each do |item, info|
			puts "#{item.to_s}   #{info[:quantity].to_s}           #{to_money(info[:price])}"
		end
		puts "\nTotal: #{to_money(total)}"
		puts "You saved #{to_money(savings)} today"
	end
end