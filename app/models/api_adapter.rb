class ApiAdapter
	class << self
		def get(url, request = nil)
			HTTParty.get(
				url,
				body: request,
				headers: { "Content-Type" => "application/json" }
			) 
		end
	end
end
