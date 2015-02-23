class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.find_by(user_name: params[:user_name])

    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to courses_path, notice: "You have successfully logged in."
    else
      flash[:error] = "Username / password combination is invalid."
      render :new
    end

  end

  def destroy
    session.clear
    redirect_to root_path, notice: "You have successfully logged out."
  end

end
