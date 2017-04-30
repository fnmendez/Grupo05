class Director < ApplicationRecord
  has_many :chapter_directeds, dependent: :destroy
  has_many :serie_directeds, dependent: :destroy
  has_many :chpaters, through: :chapter_directeds
  has_many :series, through: :serie_directeds
end
