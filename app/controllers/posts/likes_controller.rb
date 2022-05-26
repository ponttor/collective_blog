class Posts::LikesController < ApplicationController
  def create
    # @like = current_user.likes.build(params[:post_id])
    @like = current_user.likes.build
    @like.post_id = params[:post_id]
    
    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end
    post = @like.post
    redirect_to post
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    post = @like.post
    @like.destroy
    redirect_to post
  end

  private

  def like_params
    params.require(:post_like).permit(:post_id)
    params[:post_id]
  end
end
