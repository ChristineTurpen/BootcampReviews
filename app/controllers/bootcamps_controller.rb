class BootcampsController < ApplicationController

  def index
    @bootcamps = Bootcamp.all
  end

end
