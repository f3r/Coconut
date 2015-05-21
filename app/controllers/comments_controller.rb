class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      render :json => {
        :message => { :message => "Successful", :success => true }
      }
    else
      render :json => {
        :message => { :message => "Unsuccessful", :success => false }
      }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end