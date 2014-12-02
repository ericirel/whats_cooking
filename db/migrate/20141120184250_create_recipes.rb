class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :ingredients
      t.text :directions
      t.integer :time
      t.integer :user_id

      t.timestamps
    end
  end
end
