class PagesController < ApplicationController
  
  def home
    @allelements = Newsline.all + Event.all + Job.all
    @allelements.sort_by! { |ej| ej.created_at }.reverse!
    @elements = Kaminari.paginate_array(@allelements).page(params[:page]).per(10)
  end

  def about
  end
end