class PassCode < ActiveRecord::Base
  belongs_to :poll
  has_many :records, dependent: :destroy

end
