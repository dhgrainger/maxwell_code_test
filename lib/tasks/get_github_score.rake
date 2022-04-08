namespace :get_github_score do
  desc "Access Github and assign a score based on commit type"
  task dhh: :environment do
  	new_score = GitHubScore.new("dhh").calculate
  	puts "DHH's github score is #{new_score}"
  end
end
