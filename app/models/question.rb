class Question < ActiveRecord::Base
  belongs_to :Poll
  has_many :answers
end
