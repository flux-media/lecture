class User < ActiveRecord::Base
	has_one :student
	has_one :teacher
end
