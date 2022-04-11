# Controller

class PersonController < ActionController::Base
	def create
		@person = Person.new(params[:person])

		slug = "ABC123#{Time.now.to_i.to_s}1239827#{rand(10000)}"
		@person.slug = slug
		@person.admin = false

		if (Person.count + 1).odd?
			team = "UnicornRainbows"
			handle = "UnicornRainbows" + (Person.count + 1).to_s
			@person.handle = handle
			@person.team = team
		else
			team = "LaserScorpions"
			handle = "LaserScorpions" + (Person.count + 1).to_s
			@person.handle = handle
			@person.team = team
		end

		if @person.save
			Emails.validate_email(@person).deliver
			@admins = Person.where(:admin => true)
			Emails.admin_new_user(@admins, @person).deliver
			redirect_to @person, :notice => "Account added!"
		else
			render :new
		end
	end

	#valide_email
end