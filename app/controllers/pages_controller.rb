class PagesController < ApplicationController
  def home
    @allelements = Newsline.published.all + Event.accepted.all + Job.accepted.all
    @allelements.sort_by!(&:created_at).reverse!
    @elements = Kaminari.paginate_array(@allelements).page(params[:page]).per(10)
  end

  def about
  end
end
