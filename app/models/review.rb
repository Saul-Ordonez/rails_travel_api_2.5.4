class Review < ApplicationRecord
  belongs_to :destination
  validates :content, presence: true
  validates :author, presence: true


end
