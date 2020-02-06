class BootcampsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @bootcamps = Bootcamp.all
  end

  def new
    @bootcamp = Bootcamp.new
  end

  def create
    @bootcamp = current_user.bootcamps.create(bootcamp_params)
    if @bootcamp.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bootcamp = Bootcamp.find(params[:id])
  end

  def edit
    @bootcamp = Bootcamp.find(params[:id])


    if @bootcamp.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @bootcamp = Bootcamp.find(params[:id])
    if @bootcamp.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @bootcamp.update_attributes(bootcamp_params)
    if @bootcamp.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bootcamp = Bootcamp.find(params[:id])
    if @bootcamp.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    
    @bootcamp.destroy
    redirect_to root_path
  end

  private

  def bootcamp_params
    params.require(:bootcamp).permit(:name, :description, :address)
  end

end
