class CreateIntake < ActiveRecord::Migration[5.1]
  def change
    create_table :intakes do |t|
      t.references :questionnaire, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
