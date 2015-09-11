class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :omniauthable, :registerable, :recoverable, :rememberable, :trackable
	
	has_many :app_idea_upvotes

	def email_required?
  	false
	end

	def email_changed?
  	false
	end

	has_many :identities

	def twitter
    identities.where( :provider => "twitter" ).first
  end
end
