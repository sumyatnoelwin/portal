class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:lecturer_name] 
      @lecturers = Lecturer.where('lecturer_name LIKE ? ',"%#{params[:lecturer_name]}%")
      .paginate(:page => params[:page], :per_page => 5)
    else
      @lecturers = Lecturer.all
    end
    respond_with(@lecturers)
  end

  def show
    @ts = TeachingSchedule.where(:lecturer_id => @lecturer.id)
    respond_with(@lecturer)
  end

  def new
    @lecturer = Lecturer.new
    respond_with(@lecturer)
  end

  def edit
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)
    @lecturer.save
    respond_with(@lecturer)
  end

  def update
    @lecturer.update(lecturer_params)
    respond_with(@lecturer)
  end

  def destroy
    @lecturer.destroy
    respond_with(@lecturer)
  end

  private
    def set_lecturer
      @lecturer = Lecturer.find(params[:id])
    end

    def lecturer_params
      params.require(:lecturer).permit(:lecturer_name, :gender, :dob, :nrc, :email, :address, :phone, :password, :password_confirmation)
    end
end
