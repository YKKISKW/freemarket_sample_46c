class CommentsController < ApplicationController
  before_action :set_item

  def create
    @comment = @item.comments.new(comment_params)
    if @comment.comment != ''
      @comment.save
      respond_to do |format|
        format.html { redirect_to item_path(@item) }
        format.json
      end
    else
      @comments = @item.comments.includes(:user)
      flash.now[:alert] = 'コメントを入力してください'
      redirect_to item_path(@item)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
