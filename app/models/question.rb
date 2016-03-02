class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :question_images, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :question_images, reject_if: :all_blank, allow_destroy: true
  belongs_to :poll
  validates :question_header, presence: true
end
