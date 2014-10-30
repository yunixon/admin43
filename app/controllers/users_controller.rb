class UsersController < ApplicationController
  load_and_authorize_resource  param_method: :user_params
  before_action :authenticate_user!
    
  def index
    @users = User.all
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end