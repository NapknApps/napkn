class CreateAppIdeaUpvotes < ActiveRecord::Migration
  def change
    create_table :app_idea_upvotes do |t|

    	t.integer :user_id
    	t.integer :app_idea_id

      t.timestamps
    end

    add_index :app_idea_upvotes, [:user_id, :app_idea_id]

  end
end
