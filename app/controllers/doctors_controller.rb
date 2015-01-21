class DoctorsController < ApplicationController
  def photo
    @doctor = doctors_repository.find(params[:id])

    if @doctor.photo?
      send_data @doctor.photo.read, type: @doctor.photo.file.content_type, disposition: 'inline'
    else
      render nothing: true
    end
  end
end
