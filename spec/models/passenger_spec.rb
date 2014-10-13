require 'rails_helper'

RSpec.describe Passenger, :type => :model do
  it { should have_many :tickets }
  # it { should have_many :vans, through: :tickets }
end
