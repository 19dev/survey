class AddPersonToPassCode < ActiveRecord::Migration
  def change
    add_reference :pass_codes, :person, index: true, foreign_key: true
    add_reference :poll_images, :poll, index: true, foreign_key: true
  end
end
