class DevicesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]  
  def index
    @devices = Gcm::Device.all

    respond_to do |format|
#      format.html # index.html.erb
      format.json { render json: device_url(@devices) }
    end
  end

  # GET /devices/new
  # GET /devices/new.json
  def new
    @device = Gcm::Device.new

    respond_to do |format|
#      format.html # new.html.erb
      format.json { render json: device_url(@device) }
    end
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Gcm::Device.new(params[:gcm_device])
    respond_to do |format|
      if @device.save
        #format.html { redirect_to device_url(@device), notice: 'Device was successfully created.' }
        format.json { render json: device_url(@device), status: :created, location: device_url(@device) }
      else
        format.html { render action: "new" }
        format.json { render json: device_url(@device.errors), status: :unprocessable_entity }
      end
    end
  end
end
