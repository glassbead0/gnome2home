class Van < ActiveRecord::Base
  has_many :stops
  has_many :tickets
  has_many :passengers, through: :tickets
  has_one :admin # driver
end
