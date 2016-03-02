class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :person_first_name
      t.string :person_last_name
      t.text :person_descr
      t.date :person_birthday
      t.timestamps null: false
    end
  end
end
