class AddAnswerToRecords < ActiveRecord::Migration
  def change
    add_reference :records, :answer, index: true, foreign_key: true
  end
end
