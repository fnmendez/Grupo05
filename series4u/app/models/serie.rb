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
end
