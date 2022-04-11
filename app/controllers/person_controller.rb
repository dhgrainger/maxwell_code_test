# Controller

class PersonController < ActionController::Base
	def create
		team_and_handle = Person.team_and_handle
		attributes = params[:person].merge({
			slug: Person.slug,
			admin: false,
			team: team_and_handle[0],
			handle: team_and_handle[1]
		})
		@person = Person.new(attributes)

		if @person.save
			@person.new_user_emails
			redirect_to @person, :notice => "Account added!"
		else
			render :new
		end
	end
end