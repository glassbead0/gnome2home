class Van < ActiveRecord::Base
  has_many :stops, dependent: :destroy
  has_many :tickets
  has_many :passengers, through: :tickets
  has_one :admin # driver
end
