class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:users][:username], params[:users][:password])
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      fail
      flash[:errors] = ["Log in failed."]
      redirect_to new_session_url
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:users).permit(:username, :password)
  end
end
