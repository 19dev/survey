class Person < ActiveRecord::Base
	has_many :pass_codes, dependent: :destroy
	validates :person_first_name, :person_last_name, :person_birthday, presence: true
end
