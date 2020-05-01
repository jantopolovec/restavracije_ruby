class Api::V1::BuildingsController < Api::ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_request, only: [:index]
    def index
      buildings = Building.all
      building = buildings.map do |building|
        { id: building.id, ime: building.ime, user_id: building.user_id, opis: building.opis, zvezdice: building.zvezdice }
      end
      
      render json: { results: buildings }.to_json, status: :ok
    end

    def show
      render json: { result: @building }.to_json, status: :ok
    end

    def create
      @building = Building.new(building_params)
      @building.user_id = current_user.id
      @image = params[:building][:image] if params[:building][:image].present?
      if @building.save
        render json: { result: @building }.to_json, status: :ok
      else
         render json: { result: @buiding.errors}.to_json, status: :unprocessable_entity 
      end
    end

    def destroy
     
          @building.destroy
          render json: { message: 'Uspešno ste izbrisali'}.to_json, status: :ok 
     

    end

    def update
     
      if @building.update(building_params)
        render json: { result: @building }.to_json, status: :ok
      else
         render json: { result: @building.errors}.to_json, status: :unprocessable_entity 
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    def building_params
      params.require(:building).permit(:ime, :zvezdice, :opis, :naslov, :kraj, :tip, image: [])
    end
  end