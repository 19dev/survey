class AddQuestionToQuestionImage < ActiveRecord::Migration
  def change
  	add_reference :question_images, :question, index: true, foreign_key: true
  end
end
