class SessionsController < ApplicationController

  def new
    redirect_to links_path if current_user
  end

  def create
    @user = User.find_by(email_address: params[:session][:email_address])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash.now[:error] = "Incorrect Login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
