namespace :github_score do
  desc "Access Github and assign a score based on commit type"
  task :get, [:name] => :environment do |t, args|
  	puts GitHubScore.new(args.name).display
  end
end
