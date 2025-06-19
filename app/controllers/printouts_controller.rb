class PrintoutsController < ApplicationController
  def vendors_overview
    @vendors = Vendor.all
    @stands = Stand.all

    render pdf: "printout"
  end

  def vendors_and_stand_details
    @vendor = Vendor.find(vendor_params[:vendor_id])
    @stand = @vendor.stand

    render pdf: "printout"
  end

  private

  def vendor_params
    params.permit(:vendor_id)
  end
end
