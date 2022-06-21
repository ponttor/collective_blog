# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :set_post, only: %i[create destroy update edit]
    before_action :set_comment, only: %i[destroy update edit]

    def create
      @comment = current_user.comments.build(comment_params)
      @comment.post_id = @post.id
      if @comment.save
        redirect_to post_path(@post), notice: 'Comment was successfully added.'
      else
        render 'posts/show', alert: 'There were errors to add comment to post.'
      end
    end

    def new
      @comment = current_user.comments.build
    end

    def destroy
      @comment.destroy
      redirect_to post_path(@comment.post), notice: 'Comment was successfully destroyed.'
    end

    def edit; end

    def update
      if @comment.update(comment_params)
        redirect_to post_path(@comment.post), notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
