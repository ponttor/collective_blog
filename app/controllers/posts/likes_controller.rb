# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      @post = Post.find(params[:post_id])
      unless current_user.likes.find_by(post: @post)
        @like = current_user.likes.build
        @like.post_id = params[:post_id]
        @like.save
      end
      redirect_to @post
    end

    def destroy
      @post = Post.find(params[:post_id])
      if current_user.likes.find_by(post: @post)
        @like = current_user.likes.find_by(post: @post)
        @like.destroy
      end
      redirect_to @post
    end

    private

    def like_params
      params.require(:post_like).permit(:post_id)
    end
  end
end
