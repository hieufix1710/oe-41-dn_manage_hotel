# frozen_string_literal: true

class Admin::RoomsController < Admin::AdminController
  before_action :load_room_types, only: %i(new create destroy edit)
  before_action :load_room, only: %i(edit update destroy)

  def new
    @room=  Room.new
  end

  def create
    @room = Room.create(room_params)
    if @room.save
      flash[:success] = t "success"
      redirect_to admin_root_path
    else
      flash.now[:warning] = t "sowething_was_wrong_in_form"
      render :new
    end
  end

  def index
    @rooms = Room.all.paginate(page: params[:page]).per_page(Settings.paging_limit)
  end

  def show
    @room_ids = Booking.room_ids_in_booking
    @temp = Room.rooms_booking @room_ids
    @rooms = @temp.paginate(page: params[:page]).per_page(Settings.paging_limit)
  end

  def destroy
    if @room.update(deleted: 1)
      flash[:success] = t "deleted"
      redirect_to admin_root_path
    else
       flash[:warning] = t "room_not_found"
       redirect_to admin_root_path
     end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      flash[:success] = t "updated"
      redirect_to admin_root_path
    else
       flash.now[:warning] = t "sowething_was_wrong_in_form"
       reder :edit
     end
  end

  private

  def load_room
    @room = Room.find_by id: params[:id]
  end

  def room_params
    params.require(:room).permit(:name,
                                 :image, :price, :description, :room_type_id)
  end

  def load_room_types
    @room_types = RoomType.all
  end
end
