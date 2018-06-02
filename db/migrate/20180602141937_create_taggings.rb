class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.references :question, foreign_key: true
      t.references :tag, foreign_key: true
      t.integer :association_tag_id
      t.integer :association_tag_id_2
    end
  end
end
