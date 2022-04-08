class GitHubScore
	SCORES = {
		"IssuesEvent" => 7,
		"IssueCommentEvent" => 6,
		"PushEvent" => 5,
		"PullRequestReviewCommentEvent" => 4,
		"WatchEvent" => 3,
		"CreateEvent" => 2
	}.freeze 

	attr_reader :url, :name

	def initialize(name)
		@name = name
		@url = "https://api.github.com/users/#{name}/events/public"
	end

	def get_data
		ApiAdapter.get(url)
	end

	def assign_score(type)
		SCORES[type] || 1
	end

	def calculate(data)
		data.map{|commit| assign_score(commit["type"])}.reduce(:+).to_s
	end

	def display
		data = get_data
		case 
		when data.is_a?(String)
			"I'm sorry there was an issue: #{data}"
		when data.empty?
			"#{name.upcase}'s Github score was not found"
		when data.present?
			"#{name.upcase}'s Github score is #{calculate(data)}"
		end
	end
end
