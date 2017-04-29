class Season < ApplicationRecord
  belongs_to :serie
  has_many :chapters, dependent: :destroy
end
