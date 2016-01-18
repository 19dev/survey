class AddPollToPassCodes < ActiveRecord::Migration
  def change
    add_reference :pass_codes, :poll, index: true, foreign_key: true
  end
end
