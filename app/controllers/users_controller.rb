class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user && @user.update(user_params)
      flash[:notice] = "Updated"
      redirect_to current_user
    else
      flash[:alert] = "There was a problem"
      render :edit
    end
  end

  def create
    @user = User.create(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:alert] = "User deleted"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem"
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :location, :favorite_cuisine, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
