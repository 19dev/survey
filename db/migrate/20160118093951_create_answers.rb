class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
   	  t.integer :answer_no
      t.text :answer_image
<<<<<<< HEAD
      t.integer :question_no
=======
>>>>>>> a8c425a2e709e1f823aaa5842605a91fc8e46104
      t.text :answer_description

      t.timestamps null: false
    end
  end
end
