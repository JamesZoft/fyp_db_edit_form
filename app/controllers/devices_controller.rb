class DevicesController < ApplicationController
  
  def index
    @devices = Gcm::Device.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # GET /devices/new
  # GET /devices/new.json
  def new
    @device = Gcm::Device.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device }
    end
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Gcm::Device.new(params[:gcm_device])
    respond_to do |format|
      if @device.save
        #format.html { redirect_to device_url(@device), notice: 'Device was successfully created.' }
        format.json { render json: @device, status: :created, location: @device }
      else
        format.html { render action: "new" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end
end
