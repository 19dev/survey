class Poll < ActiveRecord::Base
  has_many :pass_codes, dependent: :destroy
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
