class UsersController < ApplicationController
  load_and_authorize_resource  param_method: :user_params
  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]
  #before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]
  before_action :authenticate_user!
    
  def index
    @users = User.order(:created_at).page(params[:page])
  end

  def show
  end

  def edit
  end

  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:success] = "Пользователь удален"
    redirect_to users_url
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Профиль успешно обновлен' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish_signup
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!# if @user.respond_to?(:skip_confirmation)
        sign_in(@user, bypass: true)
        redirect_to @user, notice: 'Профиль успешно обновлен'
      else
        @show_errors = true
      end
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    accessible = [:name, :email, :photo, :description, :role]
    accessible << [:password, :password_confirmation] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end

end