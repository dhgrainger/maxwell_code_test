#splitting this into it's own class since prices are subject to change
#more than say github scores ... There could be some added functionality 
#for updating prices needed in the future
class PricingTable
	PRICES = {
		milk: {unit_price: 3.97, sale_qty: 2, sale_price: 5.00},
		bread: {unit_price: 2.17, sale_qty: 3, sale_price: 6.00},
		banana: {unit_price: 0.99},
		apple: {unit_price: 0.89}
	}.freeze
end