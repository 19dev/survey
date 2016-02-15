class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_header
      t.text :question_description
      
      t.timestamps null: false
    end
  end
end
