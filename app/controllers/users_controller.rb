class UsersController < ApplicationController
  load_and_authorize_resource  param_method: :user_params
  before_action :authenticate_user!
    
  def index
    @users = User.order(:created_at).page(params[:page])
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:success] = "Пользователь удален"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :photo, :description)
  end

end