class Answer < ActiveRecord::Base
  belongs_to :Question
  has_many :records,dependent: :destroy
end
