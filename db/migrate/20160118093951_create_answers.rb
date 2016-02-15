class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer_image
      t.text :answer_description
      t.boolean :answer_is_true

      t.timestamps null: false
    end
  end
end
