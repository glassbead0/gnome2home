class ScanController < ApplicationController
  before_action :authenticate_admin!

  def ticket

  end

  def start_trip
    @my_vans = current_admin.vans
    @other_vans = Van.all
  end
end
