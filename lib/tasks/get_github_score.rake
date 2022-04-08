namespace :get_github_score do
  desc "Access Github and assign a rating"
  task dhh: :environment do
  	response = ApiAdapter.get('https://api.github.com/users/dhh/events/public')
  end
end
