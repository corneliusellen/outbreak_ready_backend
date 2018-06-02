class CreateQuestion < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.string :answers
      t.references :section, foreign_key: true
    end
  end
end
