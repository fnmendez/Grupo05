class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable,
         authentication_keys: [:username]

  has_many :chapters
  has_many :series
  has_many :views, dependent: :destroy
  has_many :chapter_ratings, through: :views
  has_many :chapter_reviews, through: :views
  has_many :serie_reviews
  has_many :serie_ratings

  has_many :kids
  has_many :kiddies, through: :kids

  has_many :inverse_kids, class_name: 'Kid', foreign_key: 'kiddy_id'
  has_many :parents, through: :inverse_kids, source: :user

  has_many :favorite_series
  has_many :favorite_chapters

  mount_uploader :picture, ProfilePictureUploader

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  before_destroy :remove_kids, :remove_series

  def email_changed?
    false
  end

  def parent
    parents.first
  end

  def is_admin?
    role == 0
  end

  def is_kid?
    role == 2
  end

  def remove_kids
    user_kids =  User.select { |user| user.is_kid? && user.parent == self }
    user_kids.each do |k|
      k.destroy
    end
    Kid.where(kiddy_id: self).or(Kid.where(user_id: self)).destroy_all
  end

  def remove_series
    Serie.destroy_from(self)
  end

end
