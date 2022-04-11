namespace :accounts do
	desc "Remove accounts where the email was never validated and it is over 30 days old"
	task :remove_unvalidated do
		@people = Person.new_invalid_users
		@people.each do |person|
			Rails.logger.info "Removing unvalidated user #{person.email}"
			person.destroy
		end
		PersonMailer.admin_removing_unvalidated_users(Person.admin, @people).deliver
	end
end