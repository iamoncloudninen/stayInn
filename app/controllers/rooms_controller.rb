class RoomsController < ApplicationController
  def index
    @rooms = Room.all

    if params[:address].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    elsif params[:keyword].present?
      @rooms = Room.where("title LIKE ? OR body LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    elsif params[:address] && params[:keyword] == nil || ''
      @rooms= Room.all
    else 
      @rooms= Room.none
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
  
    if @room.save
      redirect_to room_path(@room), notice: "施設を登録しました。"
    else
      render :new, alert: "施設の登録に失敗しました。入力内容を確認してください。"
    end
  end

  def edit
    @room = current_user.rooms.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to rooms_path, alert: "他のユーザーの施設を編集することはできません。"
  end
  
  def update
    @room = current_user.rooms.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path, notice: "施設情報が更新されました。"
    else
      render :edit
    end
  end

  def own 
    @rooms = current_user.rooms
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path, notice: '施設が削除されました。'
  end

  private
  def room_params
    params.require(:room).permit(:title, :body, :price, :address, :image)
  end
end
