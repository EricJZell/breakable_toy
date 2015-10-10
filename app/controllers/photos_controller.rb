class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    @entry = Entry.find(params[:entry_id])
    @photo.entry = @entry
    if @photo.save
      flash[:success] = "Photo successfully added"
    else
      flash[:errors] = @photo.errors.full_messages.join('. ')
    end
    redirect_to @entry

  end

  protected

  def photo_params
    params.fetch(:photo, {}).permit(:file_name)
  end
end
