class Record < ActiveRecord::Base
  belongs_to :PassCode
  belongs_to :Answer
end
