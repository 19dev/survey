class Poll < ActiveRecord::Base
  has_many :pass_codes, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :poll_images, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :poll_images, reject_if: :all_blank, allow_destroy: true
  validate :end_after_start
  validates :poll_name, :poll_start_date, :poll_finish_date, presence: true
  
end

private
def end_after_start
  return if poll_finish_date.blank? || poll_start_date.blank?
 
  if poll_finish_date <= poll_start_date
    errors.add(:poll_finish_date, "Bitiş zamanı başlangıç zamanından önce veya onunla aynı olamaz.") 
  end 
 end