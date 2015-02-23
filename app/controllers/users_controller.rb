class UsersController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

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
