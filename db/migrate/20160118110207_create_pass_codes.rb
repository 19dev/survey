class CreatePassCodes < ActiveRecord::Migration
  def change
    create_table :pass_codes do |t|
      t.string :passcode
      t.boolean :pass_code_is_finished
      
      t.timestamps null: false
    end
  end
end
