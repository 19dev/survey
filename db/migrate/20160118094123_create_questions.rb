class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_no
      t.text :question_header
      t.integer :poll_no


      t.timestamps null: false
    end
  end
end
