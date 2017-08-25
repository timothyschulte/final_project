# == Schema Information
#
# Table name: ingredients
#
#  id              :integer          not null, primary key
#  ingredient_name :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Ingredient < ApplicationRecord

has_many :recipes_ingredients, :dependent => :destroy

has_many :recipes, :through => :recipes_ingredients, :source => :recipe

validates :ingredient_name, :presence => true

end
