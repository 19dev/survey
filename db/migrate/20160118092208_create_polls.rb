class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :poll_name
      t.text :poll_description
      t.datetime :poll_start_date
      t.datetime :poll_finish_date
      t.text :poll_feedback
      t.timestamps null: false
    end
  end
end
