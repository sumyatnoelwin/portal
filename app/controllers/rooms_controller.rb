class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_staff!

  respond_to :html

  def index
    if params[:no] 
      @rooms = Room.where('no LIKE ? ',"%#{params[:no]}%")
      .paginate(:page => params[:page], :per_page => 5)
    else
      @rooms = Room.all
    end
    respond_with(@rooms)
  end

  def show
    respond_with(@room)
  end

  def new
    @room = Room.new
    respond_with(@room)
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    @room.save
    respond_with(@room)
  end

  def update
    @room.update(room_params)
    respond_with(@room)
  end

  def destroy
    @room.destroy
    respond_with(@room)
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:no, :room_name, :description)
    end
end
