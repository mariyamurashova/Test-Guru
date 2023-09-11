class Badge < ApplicationRecord
  has_one_attached :image
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :image, presence: true
end
