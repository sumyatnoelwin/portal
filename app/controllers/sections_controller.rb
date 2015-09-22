class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:section_name] or params[:course_id]
      @sections = Section.where('course_id LIKE ? AND section_name LIKE ?',"%#{params[:course_id]}%",
      "%#{params[:section_name]}%").paginate(:page => params[:page], :per_page => 5)
    else
      @sections = Section.all
    end
    respond_with(@sections)
  end

  def show
    respond_with(@section)
  end

  def new
    @section = Section.new
    @courses = Course.all
    respond_with(@section)
  end

  def edit
    @courses = Course.all
  end

  def create
    @section = Section.new(section_params)
    @section.save
    respond_with(@section)
  end

  def update
    @section.update(section_params)
    respond_with(@section)
  end

  def destroy
    @section.destroy
    respond_with(@section)
  end

  private
    def set_section
      @section = Section.find(params[:id])
    end

    def section_params
      params.require(:section).permit(:section_name, :course_id, :start_date, :end_date, :start_time, :end_time, :description)
    end
end
