class ExamListsController < ApplicationController
  before_action :set_exam_list, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:course_id] or params[:section_id] or params[:subject_id]
      @exam_lists = ExamList.where('course_id LIKE ? AND section_id LIKE ? AND
       subject_id LIKE ?',"%#{params[:course_id]}%","%#{params[:section_id]}%",
       "%#{params[:subject_id]}%").paginate(:page => params[:page], :per_page => 5)
    else
      @exam_lists = ExamList.all
    end
    respond_with(@exam_lists)
  end

  def show
    respond_with(@exam_list)
  end

  def new
    @courses = Course.all
    @sections = Section.all 
    @subjects = Subject.all 
    @exam_list = ExamList.new
    respond_with(@exam_list)
  end

  def edit
    @courses = Course.all
    @sections = Section.all 
    @subjects = Subject.all 
  end

  def create
    @exam_list = ExamList.new(exam_list_params)
    @exam_list.save
    respond_with(@exam_list)
  end

  def update
    @exam_list.update(exam_list_params)
    respond_with(@exam_list)
  end

  def destroy
    @exam_list.destroy
    respond_with(@exam_list)
  end

  private
    def set_exam_list
      @exam_list = ExamList.find(params[:id])
    end

    def exam_list_params
      params.require(:exam_list).permit(:course_id, :section_id, :subject_id, :exam_date)
    end
end
