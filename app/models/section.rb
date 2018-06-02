class Section < ApplicationRecord
  validates_presence_of :name
  has_many :questions

end
