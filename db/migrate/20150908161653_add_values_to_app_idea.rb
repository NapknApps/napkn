class AddValuesToAppIdea < ActiveRecord::Migration
  def change
  	add_column :app_ideas, :user_handle, :string
  	add_column :app_ideas, :tweet_id, :integer
  	add_column :app_ideas, :details, :text
  end
end
