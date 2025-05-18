class VendorRegistrationsController < ApplicationController
  def new
    @vendor = Vendor.new
    @stand = Stand.new
  end

  def create
    Vendor.transaction do
      @vendor = Vendor.new(registration_params[:vendor])
      @vendor.stand = Stand.new(registration_params[:stand])
      if @vendor.save
        redirect_to @vendor, notice: 'Vendor was successfully created.'
      else
        render :new
      end
    end
  end

  private

  def registration_params
    params.expect(vendor: [ :name, :legalform, :contact, :address, :phone, :email, :taxnumber, :taxoffice, :last_visit, :visit_day ], stand: [ :width, :height, :depth, :diameter, :description, :cooler, :table, :selfdriver, :trailer, :power, :specials, :misc, :vendor_id ])
  end
end