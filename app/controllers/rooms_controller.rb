class RoomsController < ApplicationController
  def index
    if params[:address].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    elsif params[:address] == nil || ''
      @rooms= Room.all
    else 
      @rooms= Room.none
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    @room.save
    redirect_to room_path(@room)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to rooms_path(@rooms)
  end

  private
  def room_params
    params.require(:room).permit(:title, :body, :price, :address, :image)
  end
end
