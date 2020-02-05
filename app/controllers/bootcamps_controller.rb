class BootcampsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @bootcamps = Bootcamp.all
  end

  def new
    @bootcamp = Bootcamp.new
  end

  def create
    current_user.bootcamps.create(bootcamp_params)
    redirect_to root_path
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
  end

  def edit
    @bootcamp = Bootcamp.find(params[:id])
  end

  def update
    @bootcamp = Bootcamp.find(params[:id])
    @bootcamp.update_attributes(bootcamp_params)
    redirect_to root_path
  end

  def destroy
    @bootcamp = Bootcamp.find(params[:id])
    @bootcamp.destroy
    redirect_to root_path
  end

  private

  def bootcamp_params
    params.require(:bootcamp).permit(:name, :description, :university)
  end

end
