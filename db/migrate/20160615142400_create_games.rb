class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :creator_id, null: false
      t.integer :avg_play_time, null: false
      t.integer :min_players, null: false
      t.integer :max_players, null: false

      t.timestamps null: false
    end
  end
end
