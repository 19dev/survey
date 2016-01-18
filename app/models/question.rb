class Question < ActiveRecord::Base
  belongs_to :p
  oll
  has_many :answers
end
