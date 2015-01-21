class Admin::ClinicalTrialsController < Admin::ApplicationController
  def index
    @clinical_trials = clinic_trials_repository.all
  end

  def new
    @clinical_trial = clinic_trials_repository.new
  end

  def create
    @clinical_trial = clinic_trials_repository.create(create_params)

    if @clinical_trial.persisted?
      redirect_to admin_clinical_trials_path(locale)
    else
      render :new
    end
  end

  def edit
    @clinical_trial = clinic_trials_repository.find(params[:id])
  end

  def update
    if @clinical_trial = clinic_trials_repository.update(params[:id], create_params)
      redirect_to admin_clinical_trials_path(locale)
    else
      render :edit
    end
  end

  def destroy
    clinic_trials_repository.destroy(params[:id])
    redirect_to admin_clinical_trials_path(locale)
  end

  private

  def create_params
    params.require(:clinical_trial).permit(:order, :condition_pl, :condition_en, :description_pl, :description_en)
  end
end
