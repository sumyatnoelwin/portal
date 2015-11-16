class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_lecturer!, :authenticate_staff!, :authenticate_student!

  respond_to :html

  def index
    if params[:lecturer_id] or params[:section_id] or params[:subject_id]
      @timetables = Timetable.where('lecturer_id LIKE ? AND section_id LIKE ? AND
       subject_id LIKE ?',"%#{params[:student_id]}%","%#{params[:section_id]}%",
       "%#{params[:subject_id]}%").paginate(:page => params[:page], :per_page => 5)
    else
      @timetables = Timetable.all
    end
    respond_with(@timetables)
  end

  def show
    respond_with(@timetable)
  end

  def new
    @timetable = Timetable.new
    respond_with(@timetable)
  end

  def edit
  end

  def create
    @timetable = Timetable.new(timetable_params)
    @timetable.save
    respond_with(@timetable)
  end

  def update
    @timetable.update(timetable_params)
    respond_with(@timetable)
  end

  def destroy
    @timetable.destroy
    respond_with(@timetable)
  end

  private
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    def timetable_params
      params.require(:timetable).permit(:section_id, :subject_id, :room_id, :lecturer_id, :lecturer_id2, :date, :start_time, :end_time, :description, :staff_id)
    end
end
