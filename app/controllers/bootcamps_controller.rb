class BootcampsController < ApplicationController

  def index
    @bootcamps = Bootcamp.all
  end

  def new
    @bootcamp = Bootcamp.new
  end

  def create
    Bootcamp.create(bootcamp_params)
    redirect_to root_path
  end

  private

  def bootcamp_params
    params.require(:bootcamp).permit(:name, :description, :university)
  end

end
