# README

Run bundle install

Exercise 1: DHH score challenge

Run bundle exec rake 'github_score:get[dhh]' which uses a rake task to access the GitHubScore model and the ApiAdapter to pull data from git and determine the 'score' based on the provided scoring system.

Exercise 2: Run bundle exec rake grocery_store:calculate_price to run the rake task which uses the checkout.rb and price.rb models to display the grocery store price.

Exercise 3: I couldnt get selenium and capybara to play nicely with a third party website so I wrote a simple script instead. Run brew install chromedriver and then  xattr -d com.apple.quarantine /usr/local/bin/chromedriver
Run the script by running ruby app/models/selenium.rb

Exercise 4: Sudo code of how i would go about refactoring a given controller, model, mailer, and rake task... Some of the syntax here is probably wrong, but I think it gives a good idea of how I like to structure my code