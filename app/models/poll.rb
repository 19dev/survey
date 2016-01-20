class Poll < ActiveRecord::Base
  has_many :pass_codes, dependent: :destroy
  has_many :questions, dependent: :destroy
end
