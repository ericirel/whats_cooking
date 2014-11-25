class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :user_id, :uniqueness => { :scope => :recipe_id }
end
