class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:student_name] or params[:section_id]
      @students = Student.where('student_name LIKE ? AND section_id LIKE ?',"%#{params[:student_name]}%",
      "%#{params[:section_id]}%").paginate(:page => params[:page], :per_page => 5)
    else
      @students = Student.all
    end
    respond_with(@students)
  end

  def show
    respond_with(@student)
  end

  def new
    @student = Student.new
    @sections = Section.all
    respond_with(@student)
  end

  def edit
    @sections = Section.all
  end

  def create
    @student = Student.new(student_params)
    @student.save
    respond_with(@student)
  end

  def update
    @student.update(student_params)
    respond_with(@student)
  end

  def destroy
    @student.destroy
    respond_with(@student)
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:student_name, :reg_no, :profile, :gender, :dob, :nrc, :address, :email, :phone, :section_id, :guardian, :relation, :password, :password_confirmation)
    end
end
