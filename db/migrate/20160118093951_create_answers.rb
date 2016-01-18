class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :answer_no
      t.text :answer_image
      t.belongs_to :question, index: true, foreign_key: true
      t.text :answer_description

      t.timestamps null: false
    end
  end
end
