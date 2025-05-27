class VendorsController < ApplicationController
  before_action :set_vendor, only: %i[ show edit update destroy ]

  # GET /vendors or /vendors.json
  def index
    if params[:column].present?
      @vendors = Vendor.order("#{params[:column]} #{params[:direction]}")
    else
      @vendors = Vendor.all
    end
    @vendors = @vendors.where("name LIKE ?", "%#{params[:name]}%") if params[:name].present?
  end

  # GET /vendors/1 or /vendors/1.json
  def show
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors or /vendors.json
  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to new_stand_path(vendor_id: @vendor.id), notice: I18n.t("vendor.created") }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1 or /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: I18n.t("vendor.updated") }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1 or /vendors/1.json
  def destroy
    @vendor.destroy!

    respond_to do |format|
      format.html { redirect_to vendors_path, status: :see_other, notice: I18n.t("vendor.deleted") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def vendor_params
      params.expect(vendor: [ :name, :legalform, :contact, :address, :phone, :email, :taxnumber, :taxoffice, :last_visit, :visit_day ])
    end
end
