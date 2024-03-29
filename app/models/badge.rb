class Badge < ApplicationRecord

  has_one_attached :image
  has_many :awordings
  has_and_belongs_to_many :users

  validates :title, presence: true
  validates :image, presence: true
  validates :rule,  presence: true
  validates :rule_value,  presence: true

  scope :active_rules, -> { where(active: true) }
  
end
