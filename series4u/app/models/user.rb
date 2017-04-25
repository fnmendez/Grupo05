class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable,
         :authentication_keys => [ :username ]

  has_many :chapters
  has_many :series
  has_many :views
  has_many :chapter_ratings, through: :views
  has_many :chapter_reviews, through: :views
  has_many :serie_reviews
  has_many :serie_ratings

  validates :username,
            :presence => true,
            :uniqueness => {
                :case_sensitive => false
            }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def email_changed?
    false
  end

end
