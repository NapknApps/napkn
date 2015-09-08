class AddUserApprovedToAppIdea < ActiveRecord::Migration
  def change
  	add_column :app_ideas, :user_approved, :boolean
  end
end
