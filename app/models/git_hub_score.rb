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

	def pull_data
		ApiAdapter.get(url)
	end

	def assign_score(type)
		SCORES[type] || 1
	end

	def calculate
		pull_data.map{|commit| assign_score(commit["type"])}.reduce(:+).to_s
	end
end
