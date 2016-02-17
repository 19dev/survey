class PollImage < ActiveRecord::Base
	belongs_to :poll
	mount_uploader :image, ImageUploader
end
