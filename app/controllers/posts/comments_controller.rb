# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @comment = current_user.comments.build(comment_params)
      @comment.post_id = resource_post.id
      if @comment.save
        redirect_to post_path(resource_post), flash: { info: t('comment_created') }
      else
        redirect_to post_path(resource_post), flash: { danger: t('messages.comment_can_not_be_empty') }

      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
