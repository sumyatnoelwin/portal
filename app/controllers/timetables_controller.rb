class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]

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
    if current_user.role == "Staff"
      @staff = Staff.where(:email => current_user.email)
      @staff.each do |staff| 
        @timetable.staff_id = staff.staff_name
      end
    elsif current_user.role == "Lecturer"
      @lecturer = Lecturer.where(:email => current_user.email)
      @lecturer.each do |lecturer|
        @timetable.staff_id = lecturer.lecturer_name
      end
    end
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
