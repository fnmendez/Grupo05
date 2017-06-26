class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook],
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

  has_many :to_sees

  mount_uploader :picture, ProfilePictureUploader

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  before_destroy :remove_kids, :remove_series

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid).first
    unless user
      user = User.create!(
                     uid: auth.uid,
                     provider: auth.provider,
                     password: Devise.friendly_token,
                     email: auth.info.email,
                     username: User.auth_username(auth),
                     picture: auth.info.image
      )
    end
    user
  end

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

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.facebook_name = auth.info.name
      user.picture = auth.info.image
    end
  end

  private

  def self.auth_username(auth)
    if auth.extra.raw_info.username.nil?
      return auth.info.email.split("@")[0]
    else
      return auth.extra.raw_info.username
    end
  end

end
