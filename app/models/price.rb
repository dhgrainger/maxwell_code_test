class Price
	attr_reader :item, :quantity
	def initialize(item, quantity)
		@item = item
		@quantity = quantity
	end

	def calculate
		sale? ? sale_total : unit_total(quantity)
	end

	def sale_total
		sales_units = quantity / sale_qty
		remainder = quantity % sale_qty
		((sales_units * sale_price) + unit_total(remainder)).round(2)
	end

	def unit_total(qty)
		(qty * unit_price).round(2)
	end

	def sale?
		sale_qty.present?
	end

	def sale_qty
		PricingTable::PRICES[item][:sale_qty]
	end

	def unit_price
		PricingTable::PRICES[item][:unit_price]
	end

	def sale_price
		PricingTable::PRICES[item][:sale_price]
	end
end