class UsersController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), notice: "You have successfully added a new user."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User was successfully updated."
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end

  private

  def find_params
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :password, :about)
  end

  def authenticate
    redirect_to '/login' unless current_user
  end

  #def current_user
    #if session[:student_id]
      #@current_student ||=Student.find(session[:student_id])
    #end
  #end

end
