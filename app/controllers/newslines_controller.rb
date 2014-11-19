class NewslinesController < ApplicationController
  load_and_authorize_resource param_method: :newsline_params
  before_action :set_newsline, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  

  respond_to :html, :json

  def index
    @newslines = Newsline.order(:created_at).page(params[:page])
    respond_with(@newslines)
  end

  def show
    respond_with(@newsline)
  end

  def new
    @newsline = Newsline.new
    respond_with(@newsline)
  end

  def edit
  end

  def create
    @newsline = Newsline.new(newsline_params)
    @newsline.save
    respond_with(@newsline)
  end

  def update
    @newsline.update(newsline_params)
    respond_with(@newsline)
  end

  def destroy
    @newsline.destroy
    respond_with(@newsline)
  end

  private

    def set_newsline
      @newsline = Newsline.find(params[:id])
    end
    
    def newsline_params
      params.require(:newsline).permit(:name, :body, :status)
    end

end
