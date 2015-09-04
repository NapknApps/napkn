class CreateAppIdeas < ActiveRecord::Migration
  def change
    create_table :app_ideas do |t|
      t.string :tweet

      t.timestamps
    end
  end
end
