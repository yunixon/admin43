class JobsController < ApplicationController
  load_and_authorize_resource param_method: :job_params
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :job_owner!, only: [:edit, :update, :destroy]

  respond_to :html, :json

  def index
    @jobs = Job.all
    respond_with(@jobs)
  end

  def show
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
    @jobs = current_user.jobs
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_owner!
      if @job.employer_id != current_user.id
        redirect_to jobs_path
        flash[:notice] = 'Недостаточно прав на обработку данного задания'
      end
    end

    def job_params
      params.require(:job).permit(:employer_id, :name, :body, :status)
    end
end
