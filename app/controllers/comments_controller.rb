class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to product_path[:product_id]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(customer_id: current_customer.id, product_id: params[:product_id])
  end
end
