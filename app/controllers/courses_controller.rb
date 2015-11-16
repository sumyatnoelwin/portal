class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_lecturer!, :authenticate_staff!
  
  respond_to :html

  def index
    @courses = Course.where('course_name LIKE ? AND related_field LIKE ?',"%#{params[:course_name]}%",
      "%#{params[:related_field]}%").paginate(:page => params[:page], :per_page => 5)
    respond_with(@courses)
  end

  def show
    respond_with(@course)
  end

  def new
    @course = Course.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @course.save
    respond_with(@course)
  end

  def update
    @course.update(course_params)
    respond_with(@course)
  end

  def destroy
    @course.destroy
    respond_with(@course)
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:course_name, :related_field, :description)
    end
end
