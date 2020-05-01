class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  # GET /buildings
  # GET /buildings.json
  def index
    
    if params[:search]
      @buildings= Building.search(params[:search]).order("created_at DESC")
    else
      @buildings =  Building.all.order('created_at DESC')
    end
  end

  def mybuildings
    @buildings = Building.where(user_id: current_user.id) 
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
   # @rooms = Room.where(building_id: id)
   
    @rooms = Room.where(building_id: @building.id) 
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)
    @building.user_id = current_user.id
    #@building.image.attach(params[:building][:image])
    @image = params[:building][:image] if params[:building][:image].present?

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Stavba je bila ustvarjena.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'Stavaba je bila posodobljena.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Stavba je bila izbrisana.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_params
      params.require(:building).permit(:ime, :zvezdice, :opis, :naslov, :kraj, :tip, image: [])
    end

   
end

 