class Payment < ActiveRecord::Base
  belongs_to :payment_state
  belongs_to :registration
  belongs_to :user
end
