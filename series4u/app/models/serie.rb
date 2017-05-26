class Serie < ApplicationRecord
  belongs_to :user
  has_many :seasons, dependent: :destroy
  has_many :chapters, through: :seasons, dependent: :destroy

  def public?
    self.user.is_admin?
  end

  def self.viewable_series(viewer)
    if viewer.nil?
      return all.select{ |serie| serie.public? }
    end
    if viewer.is_admin?
      return all
    end
    all.select{ |serie| serie.public? || serie.user == viewer }
  end

  def self.destroy_from(creator)
    where(user: creator).destroy_all
  end
    def self.search_by_title(t, viewer)
    @viewable = self.viewable_series(viewer) 
    @matched = where("title LIKE ?","%#{t}%")
    @viewable & @matched
  end

  def self.search_by_genre(g, viewer)
    @viewable = self.viewable_series(viewer)
    @matched = where("genre LIKE ?","%#{g}%")
    @viewable & @matched
  end

  def self.search(t, g, viewer)
    @by_title = self.search_by_title(t, viewer)
    @by_genre = self.search_by_genre(g, viewer)
    @by_title & @by_genre

  end
end
