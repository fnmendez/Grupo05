class View < ApplicationRecord
  belongs_to :user
  belongs_to :chapter
  has_many :chapter_reviews, dependent: :destroy
  has_many :chapter_ratings, dependent: :destroy
end
