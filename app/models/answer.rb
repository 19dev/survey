class Answer < ActiveRecord::Base
  belongs_to :Question
  has_many :records
end
