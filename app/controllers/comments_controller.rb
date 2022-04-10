class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast "comment_cahnnel", {comment: @comment, customer: @comment.customer }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(customer_id: current_customer.id, product_id: params[:product_id])
  end
end
