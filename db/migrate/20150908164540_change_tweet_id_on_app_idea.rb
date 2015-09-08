class ChangeTweetIdOnAppIdea < ActiveRecord::Migration
  def change
  	remove_column :app_ideas, :tweet_id
  	add_column :app_ideas, :tweet_id_str, :string
  end
end
