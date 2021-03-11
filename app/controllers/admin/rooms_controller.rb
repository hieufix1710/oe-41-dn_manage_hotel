# frozen_string_literal: true

class Admin::RoomsController < Admin::AdminController
<<<<<<< HEAD
    before_action :load_room_type, only: %i(new)
  def new; end

  def create
    @room = Room.create(room_params)
    if @room.save
      flash[:success] = t "success"
      redirect_to admin_rooms_path
    else
      flash.now[:warning] = t "sowething was wrong in form"
      render :new
    end
  end

=======
>>>>>>> 63d5a8b... admin-design
  def show
    @room_ids = Booking.room_ids_in_booking
    @temp = Room.rooms_booking @room_ids
    @rooms = @temp.paginate(page: params[:page]).per_page(Settings.paging_limit)
  end
<<<<<<< HEAD

  def room_params
    params.require(:room).permit(:name,
                                 :image, :price, :description, :room_type_id)
  end

  private

  def load_room_type
    @room_type = RoomType.all
  end
=======
>>>>>>> 63d5a8b... admin-design
end
