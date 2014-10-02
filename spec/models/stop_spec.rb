require 'rails_helper'

RSpec.describe Stop, :type => :model do
  it { should belong_to :van }
end
