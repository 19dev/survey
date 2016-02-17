class AddImageToPollimages < ActiveRecord::Migration
  def change
    add_column :poll_images, :image, :string
  end
end
