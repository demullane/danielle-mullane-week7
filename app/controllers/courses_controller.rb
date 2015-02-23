class CoursesController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]

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

  def update
  end

  def destroy
  end

  private
  def find_params
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :day_night)
  end

end
