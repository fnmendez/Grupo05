class Serie < ApplicationRecord
  belongs_to :user
  has_many :seasons
  has_many :chapters, through: :seasons
end
