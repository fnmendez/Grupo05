class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :season
  validates :title, presence: true
  validates :user, presence: true
  validates :season, presence: true
end
