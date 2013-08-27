class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to :back
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
