class Poll < ActiveRecord::Base
  has_many :pass_codes
  has_many :questions
end
