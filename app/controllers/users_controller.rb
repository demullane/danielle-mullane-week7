class UsersController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path, notice: "You have successfully added a new user."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :password, :about)
  end

end
