class NewslineElementsController < ApplicationController
  load_and_authorize_resource param_method: :newsline_element_params
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_newsline_element, only: [:index, :show]

  respond_to :html, :json

  def index
  end

  def new
    @newsline_element = NewslineElement.new
  end

  def show
  end

  private

    def set_newsline_element
      @newsline_element = NewslineElement.find(params[:id])
    end
    
    def newsline_element_params
      params.require(:newsline_element).permit(:element_id, :element_type, :newsline_id)
    end

end