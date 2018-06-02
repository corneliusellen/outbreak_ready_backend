class Tag < ApplicationRecord
  validates_presence_of :name
  belongs_to :category
  has_many :taggings
  has_many :questions, through: :taggings
  has_many :intakes
  has_many :questionnaires, through: :intakes

end
