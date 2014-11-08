class NewslinesController < ApplicationController
  load_and_authorize_resource param_method: :newsline_params

  respond_to :html, :json

  def index
    @newslines = Newsline.order(:created_at).page(params[:page])
    respond_with(@newslines)
  end

  
  private
    
    def newsline_params
      params.require(:newsline).permit(:newsline_element_id, :element)
    end

end
