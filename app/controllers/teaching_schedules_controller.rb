class TeachingSchedulesController < ApplicationController
  before_action :set_teaching_schedule, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:lecturer_id] or params[:section_id] or params[:subject_id]
      @teaching_schedules = TeachingSchedule.where('lecturer_id LIKE ? AND section_id LIKE ? AND
       subject_id LIKE ?',"%#{params[:lecturer_id]}%","%#{params[:section_id]}%",
       "%#{params[:subject_id]}%").paginate(:page => params[:page], :per_page => 5)
    else
      @teaching_schedules = TeachingSchedule.all
    end
    respond_with(@teaching_schedules)
  end

  def show
    respond_with(@teaching_schedule)
  end

  def new
    @teaching_schedule = TeachingSchedule.new
    @lecturers = Lecturer.all
    @sections = Section.all
    @subjects = Subject.all
    respond_with(@teaching_schedule)
  end

  def edit
    @lecturers = Lecturer.all
    @sections = Section.all
    @subjects = Subject.all
  end

  def create
    @teaching_schedule = TeachingSchedule.new(teaching_schedule_params)
    @teaching_schedule.save
    respond_with(@teaching_schedule)
  end

  def update
    @teaching_schedule.update(teaching_schedule_params)
    respond_with(@teaching_schedule)
  end

  def destroy
    @teaching_schedule.destroy
    respond_with(@teaching_schedule)
  end

  private
    def set_teaching_schedule
      @teaching_schedule = TeachingSchedule.find(params[:id])
    end

    def teaching_schedule_params
      params.require(:teaching_schedule).permit(:lecturer_id, :section_id, :subject_id, :start_date, :end_date, :total, :remark, :description)
    end
end
