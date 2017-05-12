class HomeController < ApplicationController
  def about_us

  end

  def our_doctors
    @doctors = doctors_repository.all
  end

  def our_services

  end

  def clinical_research
    @clinical_trials = clinic_trials_repository.all
  end

  def contact_us
    @doctors = doctors_repository.all
  end

  def sitemap
    render :sitemap, layout: false
  end
end
