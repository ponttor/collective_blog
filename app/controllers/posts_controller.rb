class PostsController < ApplicationController



  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def new
    # @post = Post.new
    @post = current_user.posts.build
  end

  def create
    # @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)


    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      redirect_to posts_path, status: :see_other
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :category_id)
  end
end
