# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.build(comment_params)
      @comment.post_id = @post.id
      if @comment.save
        redirect_to post_path(@post), flash: { info: t('comment_created') }
      else
        redirect_to post_path(@post), flash: { danger: t('messages.comment_can_not_be_empty') }

      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
