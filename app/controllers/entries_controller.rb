class EntriesController < ApplicationController
  before_action :authenticate_user!
  def show
    @entry = Entry.find(params[:id])
    @user = @entry.user
    verify_access(@user, current_user)
    @photos = @entry.photos
    @swell_data = @entry.swell_models[0]
    @photo = Photo.new
  end

  def new
    @entry = Entry.new
    @user = User.find(params[:user_id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.set_location
    @user = current_user
    @entry.user = @user
    swell_data = HTTParty.get("http://magicseaweed.com/api/#{ENV['MSW_KEY']}/forecast/?spot_id=#{@entry.location.msw_id}")
    if @entry.save && swell_data.code == 200
      SwellModel.create(entry: @entry, swell_data: swell_data[0])
      flash[:success] = 'New journal entry created!'
      redirect_to user_entry_path(@user, @entry)
    else
      if swell_data.code != 200
        flash[:alert] = "Sorry, swell and weather data not available at this time!"
        redirect_to user_path(@user)
      else
        flash[:alert] = @entry.errors.full_messages.join(', ')
        render :new
      end
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
      @entry.set_location
      @entry.save
      flash[:success] = 'Journal Entry Updated!'
      redirect_to user_entry_path(@user, @entry)
    else
      flash[:alert] = @entry.errors.full_messages.join(', ')
      render :edit
    end
  end

  protected

  def entry_params
    params.require(:entry).permit(
      :title, :body, :latitude, :longitude, :date
    )
  end

  def verify_access(owner, viewer)
    unless owner.friends.include?(viewer) || owner == viewer
      flash[:warning] = "You must be friends to access this section"
      redirect_to user_path(owner)
    end
  end
end
