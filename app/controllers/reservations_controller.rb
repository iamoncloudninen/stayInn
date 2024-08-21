class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
    @reservations = current_user.reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    redirect_to reservations_path, notice: '予約が確定しました。'
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])    
    @reservation = current_user.reservations.new(reservation_params)
    
    if @reservation.save
      render :confirm
    else
      render :"rooms/show"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: '予約が削除されました。'
  end
  
  
  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :number_of_guests, :room_id)
  end
end

