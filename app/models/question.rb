class Question < ApplicationRecord
  validates_presence_of :text, :answers
  belongs_to :section
  has_many :questionnaire_questions
  has_many :questionnaires, through: :questionnaire_questions
  has_many :taggings
  has_many :tags, through: :taggings
end
