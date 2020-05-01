class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.where(user_id: current_user.id) 
   @buildings = Building.all
   @rooms = Room.all
  end

  def rezervacije
    @reservations = Reservation.all 
   @buildings = Building.all
   @rooms = Room.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @rooms = Room.where(id: params[:id]) 
  end

  # GET /reservations/1/edit
  def edit
    @rooms = Room.where(id: params[:id]) 
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @count = 0
    @reservation = Reservation.new(reservation_params)
    @test = Reservation.where("room_id = ?", @reservation.room_id)
    @reservation.user_id = current_user.id
    if @reservation.do > @reservation.od
      @test.each do |t|
        @date1 = @reservation.od
        @date2 = @reservation.do
      
        while @date1 < @date2 
          if   (t.od .. t.do).include?(@date1)
            @count= @count+1
        elsif (t.od .. t.do).include?(@date2)
          @count= @count+1
        end
        @date1 = @date1+1.day
        print @date1
        end
        
      end
      if @count<1
        respond_to do |format|
          if @reservation.save
            format.html { redirect_to reservations_path, notice: 'Rezervacija je uspela.' }
            format.json { render :show, status: :created, location: @reservation }
          else
            format.html { render :new }
            format.json { render json: @reservation.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
        format.html { redirect_to request.referer, alert: 'Rezervacija ni uspela, ta datum je že zaseden.' }
        format.json { render :show, status: :created, location: @reservation }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referer, alert: 'Rezervacija ni uspela, ker sta datuma napačno zapisana.' }
        format.json { render :show, status: :created, location: @reservation }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Rezervacija je bila izbrisana' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:od, :do, :user_id, :room_id, :osebe, :cena)
    end
end
