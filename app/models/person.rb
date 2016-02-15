class Person < ActiveRecord::Base
	has_many :pass_codes, dependent: :destroy
end
