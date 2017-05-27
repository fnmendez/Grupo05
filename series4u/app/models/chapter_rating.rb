class ChapterRating < ApplicationRecord
  belongs_to :view
  validates :stars, presence: true
end
