# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  recipe_name :string
#  user_id     :string
#  genre_id    :integer
#  prep_time   :string
#  decription  :text
#  recipe_text :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ApplicationRecord
has_many :recipes_ingredients, :dependent => :destroy
has_many :bookmarks, :dependent => :destroy


has_many :ingredients, :through => :recipes_ingredients, :source => :ingredient
has_many :users, :through => :bookmarks, :source => :user


validates :recipe_name, :presence => true
validates :user_id, :presence => true
# validates :genre_id, :presence => true
belongs_to :genre
validates :prep_time, :presence => true
validates :decription, :presence => true
validates :recipe_text, :presence => true

end
