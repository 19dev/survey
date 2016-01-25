class RemoveAnswerImageFromAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :answer_image, :text
  end
end
