class Poll < ActiveRecord::Base
  has_many :pass_codes, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :poll_images, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :poll_images, reject_if: :all_blank, allow_destroy: true
  validates :poll_name, :poll_start_date, :poll_finish_date, presence: true
end
