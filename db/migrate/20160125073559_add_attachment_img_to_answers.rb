class AddAttachmentImgToAnswers < ActiveRecord::Migration
  def self.up
    change_table :answers do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :answers, :img
  end
end
