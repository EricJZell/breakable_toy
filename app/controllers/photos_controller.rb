class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    @entry = Entry.find(params[:entry_id])
    @photo.entry = @entry
    @photo.save
    flash[:success] = "Photo successfully added"
    redirect_to @entry
  end

  protected

  def photo_params
    params.require(:photo).permit(:file_name)
  end
end
