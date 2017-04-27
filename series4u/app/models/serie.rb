class Serie < ApplicationRecord
  belongs_to :user
  has_many :seasons
  has_many :chapters, through: :seasons

  def public?
    self.user.is_admin?
  end

  def self.viewable_series(viewer)
    if viewer.is_admin?
      return all
    end
    all.select{ |serie| serie.public? || serie.user == viewer }
  end
end