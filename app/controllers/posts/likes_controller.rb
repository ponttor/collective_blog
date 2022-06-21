# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      @like = current_user.likes.build
      @like.post_id = params[:post_id]

      flash[:notice] = @like.errors.full_messages.to_sentence unless @like.save
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
end
