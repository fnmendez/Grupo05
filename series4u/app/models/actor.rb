class Actor < ApplicationRecord
  has_many :chapter_acts, dependent: :destroy
  has_many :serie_acts, dependent: :destroy
  has_many :chapters, through: :chapter_acts
  has_many :series, through: :serie_acts
end
