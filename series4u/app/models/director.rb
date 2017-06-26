class Director < ApplicationRecord
  has_many :chapter_directeds, dependent: :destroy
  has_many :serie_directeds, dependent: :destroy
  has_many :chapters, through: :chapter_directeds
  has_many :series, through: :serie_directeds
  validates :name, presence: true
end
