class JobsController < ApplicationController
  load_and_authorize_resource param_method: :job_params
  before_action :set_job, only: [:show, :edit, :update, :destroy,
                                 :to_moderate, :accept, :reject, :rewrite, :complete]
  before_action :authenticate_user!, except: [:show, :index]

  respond_to :html, :json

  def index
    @jobs = Job.accepted.order(:created_at).page(params[:page])
    respond_with(@jobs)
  end

  def show
    @comments = @job.comments.with_state([:draft, :published])
    respond_with(@job)
  end

  def new
    @job = Job.new
    respond_with(@job)
  end

  def edit
  end

  def create
    @job = current_user.jobs.new(job_params)
    @job.save
    respond_with(@job)
  end

  def update
    @job.update(job_params)
    respond_with(@job)
  end

  def destroy
    @job.destroy
    respond_with(@job)
  end

  def my_jobs
    @jobs = current_user.jobs.order(:created_at).page(params[:page])
    respond_with(@jobs)
  end

  def moderating
    @jobs = Job.moderating.order(:created_at).page(params[:page])
    respond_with(@jobs) do |format|
      format.html { render :index }
    end
  end

  def to_moderate
    @job.submit! if @job.new?
    redirect_to job_path
  end

  def accept
    @job.accept! if @job.moderating?
    redirect_to job_path
  end

  def reject
    @job.reject! if @job.moderating?
    redirect_to job_path
  end

  def rewrite
    @job.rewrite! if @job.rejected?
    redirect_to job_path
  end

  def complete
    @job.complete! if @job.accepted?
    redirect_to job_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:employer_id, :name, :body, :status)
  end
end
