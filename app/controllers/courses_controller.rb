class CoursesController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path, notice: "Course has been successfully created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: "Course was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: "Course was successfully deleted."
  end

  private
  def find_params
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :day_night)
  end

  def authenticate
    redirect_to '/login' unless current_user
  end

end
