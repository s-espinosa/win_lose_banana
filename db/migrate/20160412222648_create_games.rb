class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :game_code
    end
  end
end
