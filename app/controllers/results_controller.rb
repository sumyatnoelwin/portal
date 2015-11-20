class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:student_id] or params[:section_id] or params[:subject_id]
      @results = Result.where('student_id LIKE ? AND section_id LIKE ? AND
       subject_id LIKE ?',"%#{params[:student_id]}%","%#{params[:section_id]}%",
       "%#{params[:subject_id]}%").paginate(:page => params[:page], :per_page => 5)
    else
      @results = Result.all
    end
    respond_with(@results)
  end

  def show
    respond_with(@result)
  end

  def new
    @result = Result.new
    respond_with(@result)
  end

  def edit
  end

  def create
    @result = Result.new(result_params)
    @result.save
    respond_with(@result)
  end

  def update
    @result.update(result_params)
    respond_with(@result)
  end

  def destroy
    @result.destroy
    respond_with(@result)
  end

  def dynamic_student
    @student = Student.where('section_id = ?', params[:id])
    respond_to do |format|
      format.js
    end
  end
  
  def dynamic_exam
    @subject = ExamList.where('title = ?', params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
    def set_result
      @result = Result.find(params[:id])
    end

    def result_params
      params.require(:result).permit(:exam_id, :student_id, :section_id, :subject_id, :result, :date, :remark)
    end
end
