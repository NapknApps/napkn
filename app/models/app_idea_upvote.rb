class AppIdeaUpvote < ActiveRecord::Base

	belongs_to :user
	belongs_to :app_idea

	validates :user_id, uniqueness: { scope: :app_idea_id }
	
end
