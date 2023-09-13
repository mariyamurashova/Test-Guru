class Badge < ApplicationRecord
  has_one_attached :image
  has_many :awordings
  has_many :users, through: :awordings

  validate :validate_active_rule_number, on: :create

  validates :title, presence: true
  validates :image, presence: true
  validates :rule_category, uniqueness: { scope: :rule_level } 
  validates :rule_level, uniqueness: { scope: :rule_category } 

  scope :active_rules, -> { where(active: true) }
  scope :category_rules, -> { where.not(rule_category: nil) }
  scope :level_rules, -> { where.not(rule_level: nil) }
  
  

   def validate_active_rule_number       
     self.errors.add(:base, "3 active rules already exist") if Badge.active_rules.length > 3
 end 
end
