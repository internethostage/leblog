class UsersController < ApplicationController
before_action :find_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "Account Created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to root_path, notice: "Profile updated successfully!"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :current_password, :password, :password_confirmation)
  end

  def find_user
    @user = User.find params[:id]
  end

end


# TODO ADD PASSWORD RESET
