class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_no
      t.text :question_header
<<<<<<< HEAD
      t.integer :poll_no


=======
      
>>>>>>> a8c425a2e709e1f823aaa5842605a91fc8e46104
      t.timestamps null: false
    end
  end
end
