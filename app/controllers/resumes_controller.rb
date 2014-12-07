class ResumesController < ApplicationController
  load_and_authorize_resource param_method: :resume_params
  before_action :set_resume, only: [:show, :edit, :update, :destroy, :publicate]
  before_action :authenticate_user!

  respond_to :html, :json

  def index
    @resumes = Resume.published.order(:created_at).page(params[:page])
    respond_with(@resumes)
  end

  def show
    respond_with(@resume)
  end

  def new
    @resume = Resume.new
    respond_with(@resume)
  end

  def edit
  end

  def create
    @resume = Resume.new(resume_params.merge(status: :unpublished, user: current_user))
    @resume.save
    respond_with(@resume)
  end

  def update
    @resume.update(resume_params)
    respond_with(@resume)
  end

  def destroy
    @resume.destroy
    respond_with(@resume)
  end

  def my_resumes
    @resumes = current_user.resumes.order(:created_at).page(params[:page])
    respond_with(@resumes)
  end

  def publicate
    @resume.publicate! if @resume.unpublished?
    redirect_to resume_path
  end

  private

  def set_resume
    @resume = Resume.friendly.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:user_id, :name, :body, :status)
  end
end
