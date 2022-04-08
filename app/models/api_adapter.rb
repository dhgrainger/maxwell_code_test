class ApiAdapter
	class << self
		def get(url, request = nil)
			response = HTTParty.get(
				url,
				body: request,
				headers: { "Content-Type" => "application/json" }
			) 
			successful?(response) ? response : log_error(response)
		end

		#success can now be easily defined as many things
		def successful?(response)
			response.code == 200
		end

		#errors can now be reported and this could be built out to give more details
		def log_error(response)
			"Error: #{response.code}"
		end
	end
end
