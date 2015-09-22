class ForumCommentsController < ApplicationController
  before_action :set_forum_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @forum_comments = ForumComment.all
    respond_with(@forum_comments)
  end

  def show
    respond_with(@forum_comment)
  end

  def new
    @forum_comment = ForumComment.new
    respond_with(@forum_comment)
  end

  def edit
  end

  def create
    @forum_comment = ForumComment.new(forum_comment_params)
    @forum_comment.save
    respond_with(@forum_comment)
  end

  def update
    @forum_comment.update(forum_comment_params)
    respond_with(@forum_comment)
  end

  def destroy
    @forum_comment.destroy
    respond_with(@forum_comment)
  end

  private
    def set_forum_comment
      @forum_comment = ForumComment.find(params[:id])
    end

    def forum_comment_params
      params.require(:forum_comment).permit(:forum_id, :comment, :author_id)
    end
end
