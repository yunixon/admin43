class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @resumes = Resume.all
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
    @resume = Resume.new(resume_params)
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

  private
    def set_resume
      @resume = Resume.find(params[:id])
    end

    def resume_params
      params.require(:resume).permit(:employer_id, :name, :body, :status)
    end
end
