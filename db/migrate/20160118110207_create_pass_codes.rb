class CreatePassCodes < ActiveRecord::Migration
  def change
    create_table :pass_codes do |t|
      t.string :passcode
<<<<<<< HEAD
      t.integer :poll_no
=======
>>>>>>> a8c425a2e709e1f823aaa5842605a91fc8e46104
      t.boolean :pass_code_is_finished
      
      t.timestamps null: false
    end
  end
end
