class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :person_first_name
      t.string :person_last_name
      t.date :person_birthday
      t.integer :person_tc, :limit => 8
      t.string :person_tel_no
      t.timestamps null: false
    end
  end
end
