class AddPassCodeToRecords < ActiveRecord::Migration
  def change
    add_reference :records, :pass_code, index: true, foreign_key: true
  end
end
