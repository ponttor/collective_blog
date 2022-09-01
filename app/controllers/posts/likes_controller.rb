# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      return if current_user.likes.find_by(post: resource_post)

      @like = current_user.likes.build
      @like.post_id = params[:post_id]
      @like.save
      redirect_to resource_post
    end

    def destroy
      @like = current_user.likes.find_by(post: resource_post)
      return unless @like

      @like.destroy
      redirect_to resource_post
    end
  end
end
