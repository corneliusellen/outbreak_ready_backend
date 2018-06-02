class CreateQuestionnaire < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.string :title
    end
  end
end
