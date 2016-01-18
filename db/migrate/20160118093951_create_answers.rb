class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
   	  t.integer :answer_no
      t.text :answer_image
      t.integer :question_no
      t.text :answer_description

      t.timestamps null: false
    end
  end
end
