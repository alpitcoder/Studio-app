 class MusicStudioController < ApplicationController
  before_action :check_value, only: [:index],if: -> {params[:start_time].present? && params[:end_time].present?}

  def index
    @studios=Studio.all.left_outer_joins(:bookings)
    if params[:location].present?
      @studios=@studios.where('location like ?',"%#{params[:location]}%")
    end
    if params[:start_time].present? && params[:end_time].present?
      studios = @studios.where('opening_time <= ? AND closing_time >= ? AND bookings.start_time BETWEEN ? AND ? AND bookings.start_time!= ? AND bookings.status !=? AND bookings.start_time!=?',Time.parse(params[:start_time]),Time.parse(params[:end_time]),Time.parse(params[:start_time]),Time.parse(params[:end_time]),"NULL","Confirmed","NULL")
    end
  end

  private

  def check_value
    if(params[:start_time] > params[:end_time] || params[:start_time] < Time.now)
      flash[:error] = "Select Appropriate Date Time."
      redirect_to  music_studio_index_path
    end
  end

end
