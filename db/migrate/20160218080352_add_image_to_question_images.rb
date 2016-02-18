class AddImageToQuestionImages < ActiveRecord::Migration
  def change
    add_column :question_images, :image, :string
  end
end
