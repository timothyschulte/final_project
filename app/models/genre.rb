# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  genre_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Genre < ApplicationRecord

has_many :recipes, :dependent => :destroy
validates :genre_name, :presence => true

end
