class Actor < ApplicationRecord
  has_many :chapters, through: :chapter_acts
  has_many :series, through: :serie_acts
end
