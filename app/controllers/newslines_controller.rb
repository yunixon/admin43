class NewslinesController < ApplicationController
  load_and_authorize_resource param_method: :newsline_params
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_newsline, only: [:show]

  respond_to :html, :json

  def index
    @newslines = Newsline.order(:created_at).page(params[:page])
    respond_with(@newslines)
  end

  def show
    respond_with(@newsline)
  end

  private

    def set_newsline
      @newsline = Newsline.find(params[:id])
    end
    
    def newsline_params
      params.require(:newsline).permit(:newsline_element_id, :element)
    end

end
