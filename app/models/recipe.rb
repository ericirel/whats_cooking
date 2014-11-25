class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :votes

  def tag_list=(tags_string)
    tags_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")

  def self.search(search)
    if search
      where('title LIKE :search OR directions LIKE :search OR ingredients LIKE :search', search: "%#{search}%")
    else
      self.all
    end
  end
  end
end
