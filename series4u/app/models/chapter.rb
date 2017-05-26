class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many :chapter_acts, dependent: :destroy
  has_many :chapter_directeds, dependent: :destroy
  has_many :actors, through: :chapter_acts
  has_many :directors, through: :chapter_directeds
  has_many :views, dependent: :destroy
  validates :title, presence: true
  validates :user, presence: true
  validates :season, presence: true
end
