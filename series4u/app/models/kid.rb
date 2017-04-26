class Kid < ApplicationRecord
  belongs_to :user
  belongs_to :kiddy, :class_name => 'User'
end
