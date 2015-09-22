class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @timetables = Timetable.all
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
      params.require(:timetable).permit(:section_id, :subject_id, :room_id, :lecturer_id, :start_time, :end_time, :description, :staff_id)
    end
end
