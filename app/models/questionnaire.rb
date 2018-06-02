class Questionnaire < ApplicationRecord
  validates_presence_of :title
  has_many :questionnaire_questions
  has_many :questions, through: :questionnaire_questions

end
