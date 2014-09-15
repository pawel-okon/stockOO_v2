class Api::V1::ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]

  # GET /manufacturers
  # GET /manufacturers.json
  def index
    @manufacturers = Manufacturer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manufacturers }
    end
  end

  # GET /manufacturers/1
  # GET /manufacturers/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manufacturer }
    end
  end

  # GET /manufacturers/new
  # GET /manufacturers/new.json
  def new
    @manufacturer = Manufacturer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manufacturer }
    end
  end

  # GET /manufacturers/1/edit
  def edit
  end

  # POST /manufacturers
  # POST /manufacturers.json
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to api_v1_manufacturer_path(@manufacturer), notice: 'Producent został pomyślnie dodany.' }
        format.json { render json: @manufacturer, status: :created, location: @manufacturer }
      else
        format.html { render action: "new" }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /manufacturers/1
  # PUT /manufacturers/1.json
  def update
    respond_to do |format|
      if @manufacturer.update_attributes(manufacturer_params)
        format.html { redirect_to api_v1_manufacturer_path(@manufacturer), notice: 'Producent został pomyślnie zaktualizowany' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturers/1
  # DELETE /manufacturers/1.json
  def destroy
    @manufacturer.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_manufacturers_url }
      format.json { head :no_content }
    end
  end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
