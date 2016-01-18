class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer_image
      t.text :answer_description

      t.timestamps null: false
    end
  end
end
