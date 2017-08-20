# == Schema Information
#
# Table name: recipes_ingredients
#
#  id            :integer          not null, primary key
#  recipe_id     :integer
#  ingredient_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RecipesIngredient < ApplicationRecord

belongs_to :recipe
belongs_to :ingredient

end
