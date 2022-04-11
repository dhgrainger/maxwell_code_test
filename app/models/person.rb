class Person < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :admin, presence: true
	validates :slug, presence: true
	validates :handle, presence: true
	validates :team, presence: true

	scope :new_invalid_users -> {where('created_at < ?', Time.now - 30.days), where(:validated => false) }	
	scope :admins -> {where(admin: true)}
	class << self
		def slug
			"ABC123#{Time.now.to_i.to_s}1239827#{rand(10000)}"
		end

		def team_and_handle
			if (Person.count + 1).odd?
				team = "UnicornRainbows"
				handle = "UnicornRainbows" + (Person.count + 1).to_s
			else
				team = "LaserScorpions"
				handle = "LaserScorpions" + (Person.count + 1).to_s
			end
			[team,handle]
		end
	end

	def new_user_emails
		if PersonMailer.validate_email(self).deliver #not sure on the syntax here but check if this is successful
			Rails.logger.info "USER: User ##{self.id} validated email successfully."
			PersonMailer.welcome(self).deliver!
			PersonMailer.admin_new_user(Person.admins, self).deliver
		end
	end
end