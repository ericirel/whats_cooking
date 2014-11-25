class AddFavoriteCuisineToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite_cuisine, :string
  end
end
