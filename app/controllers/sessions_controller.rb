class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email params[:signin][:email]
    if @user && @user.authenticate(params[:signin][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Wrong email or password, please try again"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  private

  def redirect_if_loggedin
    redirect_to root_path, notice: "Already logged in" if user_signed_in?
  end

end
