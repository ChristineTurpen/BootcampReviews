class BootcampsController < ApplicationController

  def index
    @bootcamps = Bootcamp.all
  end

  def new
    @bootcamp = Bootcamp.new
  end

end
