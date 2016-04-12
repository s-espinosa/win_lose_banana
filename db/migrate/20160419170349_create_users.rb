class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false

      t.string :name, null: false
      t.references :role, index: true
    end
  end
end
