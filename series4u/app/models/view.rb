class View < ApplicationRecord
  belongs_to :user
  belongs_to :chapter
  has_many :chapter_reviews
  has_many :chapter_ratings
end
