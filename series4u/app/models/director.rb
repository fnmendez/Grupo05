class Director < ApplicationRecord
  has_many :chpaters, through: :chapter_directeds
  has_many :series, through: :serie_directeds
end
