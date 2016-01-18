class PassCode < ActiveRecord::Base
  belongs_to :Poll
  has_many :records

end
