class RegistrationsController < ApplicationController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to courses_path, notice: "You have successfully signed up and logged in."
  else
    render :new
  end
end

private
  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation)
  end

end
