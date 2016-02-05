class Record < ActiveRecord::Base
  belongs_to :pass_code
  belongs_to :answer
end
