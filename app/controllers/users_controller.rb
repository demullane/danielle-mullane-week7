class UsersController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    puts "HELLO"*5
    @user = User.new
    puts @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
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
