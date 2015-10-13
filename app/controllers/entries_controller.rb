class EntriesController < ApplicationController
  before_action :authenticate_user!
  def show
    @entry = Entry.find(params[:id])
    @user = @entry.user
    @photos = @entry.photos
    @photo = Photo.new
  end

  def new
    @entry = Entry.new
    @user = User.find(params[:user_id])
  end

  def create
    binding.pry
    @entry = Entry.new(entry_params)
    @entry.location = find_nearest_location(@entry.latitude, @entry.longitude)
    @entry.country = @entry.location.country
    @entry.region = @entry.location.country.region
    @user = current_user
    @entry.user = @user
    if @entry.save
      flash[:success] = 'New journal entry created!'
      redirect_to user_path(@user)
    else
      flash[:warning] = @entry.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @user = @entry.user
    @entry.destroy
    flash[:success] = "Journal Entry Deleted!"
    redirect_to user_path(@user)
  end

  def edit
    @entry = Entry.find(params[:id])
    @user = @entry.user
  end

  def update
    @entry = Entry.find(params[:id])
    @user = current_user
    @entry.user = @user
    if @entry.update(entry_params)
      @entry.location = find_nearest_location(@entry.latitude, @entry.longitude)
      @entry.country = @entry.location.country
      @entry.region = @entry.location.country.region
      @entry.save
      flash[:success] = 'Journal Entry Updated!'
      redirect_to user_entry_path(@user, @entry)
    else
      flash[:warning] = @entry.errors.full_messages.join(', ')
      render :edit
    end
  end

  protected

  def entry_params
    params.require(:entry).permit(
      :title, :body, :latitude, :longitude, :date
    )
  end

  def find_nearest_location(lat1, lon1)
    locations = Location.all
    nearest_distance = 1000000
    nearest_location = locations.first
    locations.each do |location|
      distance = distance_miles(lat1, lon1, location.lat, location.lon)
      if distance < nearest_distance
        nearest_location = location
        nearest_distance = distance
      end
    end
    nearest_location
  end

  def distance_miles(lat1, lon1, lat2, lon2)
    #rmiles = radius of earth in miles
    rmiles = 3956
    rad_per_deg = 0.017453293
    dlon = lon2 - lon1
    dlat = lat2 - lat1

    dlon_rad = dlon * rad_per_deg
    dlat_rad = dlat * rad_per_deg

    lat1_rad = lat1 * rad_per_deg
    #lon1_rad = lon1 * rad_per_deg

    lat2_rad = lat2 * rad_per_deg
    #lon2_rad = lon2 * rad_per_deg

    a = (Math.sin(dlat_rad / 2))**2 + Math.cos(lat1_rad) *
      Math.cos(lat2_rad) * (Math.sin(dlon_rad / 2))**2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    dMi = rmiles * c
    return dMi
  end

end
