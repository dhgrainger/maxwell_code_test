class Person < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :email, :admin, :slug, :validated, :handle, :team
	
	scope :new_invalid_user -> {where('created_at < ?', Time.now - 30.days), where(:validated => false) }	

	def validate_email

		@user = Person.find_by_slug(params[:slug])
		if @user.present?
			@user.validated = true
			@user.save
			Rails.logger.info "USER: User ##{@person.id} validated email successfully."
			@admins = Person.where(:admin => true)
			Emails.admin_user_validated(@admins, user)
			Emails.welcome(@user).deliver!
		end
	end
end