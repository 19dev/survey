class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_header
      
      t.timestamps null: false
    end
  end
end
