class Admin::LocationsController < AdminController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to admin_locations_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @location.update_attributes(location_params)
      redirect_to admin_locations_path
    else
      render :new
    end
  end

  def destroy
    @location.destroy
    redirect_to admin_locaitons_path 
  end

  private

  def location_params
    params.require(:location).permit(:street_address, :street_address2, :city, :state, :zip,
    employees_attributes: [:name, :badge_number, :id, :_destroy])
  end

  def find_location
    @location = Location.find(params[:id])
  end
end
