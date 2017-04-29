class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many :chapter_acts
  has_many :chapter_directeds
  has_many :actors, through: :chapter_acts
  has_many :directors, through: :chapter_directeds
  has_many :views
  validates :title, presence: true
  validates :user, presence: true
  validates :season, presence: true

  def rating_average
    if views.count == 0
      return 0
    end
    total = 0
    views.each do |view|
      total+= view.stars
    end
    total/views.count
  end
end
