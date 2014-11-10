class DoctorsController < ApplicationController
  def photo
    @doctor = Doctor.find(params[:id])

    if @doctor.photo? && stale?(:etag => @doctor.photo.read, :last_modified => @doctor.updated_at.utc, :public => true)
      send_data @doctor.photo.read, :type => @doctor.photo.file.content_type, :disposition => 'inline'
      expires_in 0, :public => true
    else
      render :nothing => true
    end
  end
end
