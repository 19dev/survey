class PassCode < ActiveRecord::Base
  belongs_to :poll
  has_many :records, dependent: :destroy
  belongs_to :person
end
