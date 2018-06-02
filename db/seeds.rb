# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

categories_data = CSV.open('./db/data/categories.csv', headers: true, header_converters: :symbol)

tags_data = CSV.open('./db/data/tags.csv', headers: true, header_converters: :symbol)

questions_data = CSV.open('./db/data/questions.csv', headers: true, header_converters: :symbol)

sections = ["Demographic", "Clinical", "Exposure"]

Tagging.destroy_all
Tag.destroy_all
Category.destroy_all
Question.destroy_all
Section.destroy_all

def seed_categories(category_data)
  ActiveRecord::Base.connection.reset_pk_sequence!(:categories)
  category_data.each do |category|
    entity = Category.create!(name: category[:category])
    puts "Created #{entity.name}"
  end
end

def seed_tags(tag_data)
  ActiveRecord::Base.connection.reset_pk_sequence!(:tags)
  tag_data.each do |tag|
    entity = Tag.create!(name: tag[:tag], category_id: tag[:category_id])
    puts "Created #{entity.name}"
  end
end

def seed_sections(sections)
  ActiveRecord::Base.connection.reset_pk_sequence!(:sections)
  sections.each do |section|
    Section.create!(name: section)
  end
end

def seed_questions(question_data)
  ActiveRecord::Base.connection.reset_pk_sequence!(:taggings)
  question_data.each do |question|
    q = Question.create!(id: question[:id],
                    text: question[:question],
                    answers: question[:answers],
                    section_id: question[:category])
    3.times do |i|
      if i == 0
        Tagging.create!(tag_id: question[:tag1], question_id: q.id, association_tag_id: question[:association1], association_tag_id_2: question[:association2])
      elsif i == 1
        Tagging.create!(tag_id: question[:tag2], question_id: q.id) rescue next
      else
        Tagging.create!(tag_id: question[:tag3], question_id: q.id) rescue next
      end
    end
  end
  puts "Created #{Question.count} questions and #{Tagging.count} taggings"
end

seed_categories(categories_data)
seed_tags(tags_data)
seed_sections(sections)
seed_questions(questions_data)
