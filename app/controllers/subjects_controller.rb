class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_lecturer!, :authenticate_staff!, :authenticate_student!

  respond_to :html

  def index
    @subjects = Subject.all
    respond_with(@subjects)
  end

  def show
    respond_with(@subject)
  end

  def new
    @subject = Subject.new
    @courses = Course.all
    respond_with(@subject)
  end

  def edit
    @courses = Course.all
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.save
    respond_with(@subject)
  end

  def update
    @subject.update(subject_params)
    respond_with(@subject)
  end

  def destroy
    @subject.destroy
    respond_with(@subject)
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:subject_name, :course_id, :description)
    end
end
