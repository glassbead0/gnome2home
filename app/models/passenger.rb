class Passenger < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets
  has_many :vans, through: :tickets

  validates_presence_of :email, :first_name, :last_name, on: :create

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |passenger|
      passenger.email = auth.info.email
      passenger.first_name = auth.extra.raw_info.first_name
      passenger.last_name = auth.extra.raw_info.last_name
      passenger.password = Devise.friendly_token[0,20]
      passenger.image = auth.info.image # assuming the passenger model has an image
    end
  end
end
