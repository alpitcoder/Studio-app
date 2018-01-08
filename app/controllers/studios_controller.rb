class StudiosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @studio = Studio.find(params[:id])
  end

  def new
    @studio = current_user.studios.build
  end

  def create
    @studio=current_user.studios.build(studio_params)
    @studio=@studio.save!
    if @studio.valid?
      flash[:notice] = "Successfully created studio!"
      redirect_to studio_path(@studio)
    else
      flash[:alert] = "Error creating new studio!"
      render :new
    end
  end



  def show

  end

  private

  def studio_params
    params.require(:studio).permit(:name, :location, :opening_time, :closing_time, :studio_type, :price)
  end

end
