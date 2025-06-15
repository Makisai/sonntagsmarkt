class PrintoutsController < ApplicationController
  def vendors_overview
    @vendors = Vendor.all

    render pdf: "printout"
  end
end
