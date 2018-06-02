class CreateQuestionnaireQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaire_questions do |t|
      t.references :questionnaire, foreign_key: true
      t.references :question, foreign_key: true
    end
  end
end
