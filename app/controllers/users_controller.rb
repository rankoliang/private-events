class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @attending_events = @user.events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
