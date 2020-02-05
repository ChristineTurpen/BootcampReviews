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

  private

  def bootcamp_params
    params.require(:bootcamp).permit(:name, :description, :university)
  end

end
