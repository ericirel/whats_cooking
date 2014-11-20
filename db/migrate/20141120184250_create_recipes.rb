class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :ingredients
      t.text :directions
      t.integer :time

      t.timestamps
    end
  end
end
