class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :records, dependent: :destroy
  mount_uploader :image, ImageUploader
end
