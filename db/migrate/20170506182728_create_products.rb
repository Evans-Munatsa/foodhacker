class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :food_type
      t.text :description

      t.integer :user_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
