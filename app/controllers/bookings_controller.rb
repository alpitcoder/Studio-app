class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @studio= Studio.find_by_id(params[:studio_id])
    @booking=current_user.bookings.build
  end
  def index
  end

  def create
    @studio= Studio.find_by_id(params[:studio_id])
    if params[:start_time].present? && params[:end_time].present?
      @booking=Booking.where("((end_time > ?) OR (start_time BETWEEN ? AND ?)) AND status= ? AND studio_id=?",DateTime.parse(params[:start_time]),DateTime.parse(params[:start_time]),DateTime.parse(params[:end_time]),"Confirmed",@studio.id)
      if ((@booking.present?) || (@studio.opening_time >DateTime.parse(params[:start_time]) || @studio.closing_time< DateTime.parse(params[:end_time]) ))
          flash[:notice]="Studio has already been booked for this time, Please select some other time slot."
          render :new
      else
        @studio= Studio.find_by_id(params[:studio_id])
        @booking=current_user.bookings.build(booking_params)
        @booking.studio_id=@studio.id
        @booking.status="Confirmed"
        if @booking.save!
          flash[:notice]="Successfuilly booked the studio."
          redirect_to music_studio_index_path
        end
      end
    end
  end


  private

  def booking_params
    params.permit(:start_time,:end_time)
  end
end
