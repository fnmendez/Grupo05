class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :season
  has_many :chapter_acts, dependent: :destroy
  has_many :chapter_directeds, dependent: :destroy
  has_many :actors, through: :chapter_acts
  has_many :directors, through: :chapter_directeds
  has_many :views, dependent: :destroy
  has_many :favorite_chapters, dependent: :destroy
  has_many :to_sees, dependent: :destroy
  validates :title, presence: true
  validates :user, presence: true
  validates :season, presence: true

  def self.viewable_chaps(viewer)
    if viewer.nil?
      return all.select{ |chap| chap.season.serie.public? }
    end
    if viewer.is_admin?
      return all
    end
    all.select{ |chap| chap.season.serie.public? || chap.season.serie.user == viewer }
  end

  def self.search_by_title(t)
    where("title ILIKE ?","%#{t}%")
  end

  def self.search(t, viewer)
    @viewable = viewable_chaps(viewer)
    @by_title = search_by_title(t)
    @viewable & @by_title
  end

  def serie
    self.season.serie
  end

  def average_rating
    ratings = ChapterRating.where(view: self.views)
    if ratings.count == 0
      return 0
    end
    total = 0
    ratings.each do |rating|
      total+=rating.stars
    end
    total/ratings.count
  end

end
