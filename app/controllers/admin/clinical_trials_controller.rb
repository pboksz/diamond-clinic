class Admin::ClinicalTrialsController < Admin::ApplicationController
  def index
    @clinical_trials = ClinicalTrial.all
  end

  def new
    @clinical_trial = ClinicalTrial.new
  end

  def create
    @clinical_trial = ClinicalTrial.new(create_params)

    if @clinical_trial.save
      redirect_to admin_clinical_trials_path(locale)
    else
      render :new
    end
  end

  def destroy
    @clinical_trial = ClinicalTrial.find(params[:id]).destroy
    redirect_to admin_clinical_trials_path(locale)
  end

  private

  def create_params
    params.require(:clinical_trial).permit(:condition, :description_pl, :description_en)
  end
end