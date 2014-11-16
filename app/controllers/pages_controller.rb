class PagesController < ApplicationController
  
  def home
    @events_and_jobs = Event.all + Job.all
    @events_and_jobs.sort_by! { |ej| ej.created_at }.reverse!
    @elements = Kaminari.paginate_array(@events_and_jobs).page(params[:page]).per(10)
  end

  def about
  end
end
