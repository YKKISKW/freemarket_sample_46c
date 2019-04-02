class LikesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @like = current_user.likes.find_by(item: @item)
    toggle(@item)
  end

  private

  def toggle(item)
    if @like
      return head :unprocessable_entity unless @like.destroy
    else
      @like = current_user.likes.build(item: item)
      return head :unprocessable_entity unless @like.save
    end
    head :ok
  end
end
