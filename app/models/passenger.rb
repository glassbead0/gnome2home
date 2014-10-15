class Passenger < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets
  has_many :vans, through: :tickets

  validates :email, :first_name, :last_name, presence: true
end
