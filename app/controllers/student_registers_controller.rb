class StudentRegistersController < ApplicationController
  before_action :set_student_register, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @student_registers = StudentRegister.all
    respond_with(@student_registers)
  end

  def show
    respond_with(@student_register)
  end

  def new
    @student_register = StudentRegister.new
    respond_with(@student_register)
  end

  def edit
  end

  def create
    @student_register = StudentRegister.new(student_register_params)
    @student_register.save
    respond_with(@student_register)
  end

  def update
    @student_register.update(student_register_params)
    respond_with(@student_register)
  end

  def destroy
    @student_register.destroy
    respond_with(@student_register)
  end

  private
    def set_student_register
      @student_register = StudentRegister.find(params[:id])
    end

    def student_register_params
      params.require(:student_register).permit(:student_id, :section_id, :tution_fees, :exam_fees, :register_date, :complete_tf, :complete_ef, :staff_id, :remark)
    end
end