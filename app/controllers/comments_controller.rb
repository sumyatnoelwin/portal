class CommentsController < ApplicationController
  def create

    @forum = Forum.find(params[:forum_id])
    @comment = @forum.comments.new(comment_params)

    if current_user.role == "Student"
      @student = Student.where(:email => current_user.email)
      @student.each do |student|
        @comment.student_id = student.student_name
      end
    end
    @comment.save
    # @comment = @forum.comments.create(comment_params)
    redirect_to forum_path(@forum)
  end

  def destroy
    @forum = Forum.find(params[:forum_id])
    @comment = @forum.comments.find(params[:id])
    @comment.destroy
    redirect_to forum_path(@forum)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:student_id, :body)
    end
end
