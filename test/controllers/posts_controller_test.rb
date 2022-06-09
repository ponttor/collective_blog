require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    @attrs = {
      title: Faker::TvShows::TheITCrowd.character,
      body: Faker::TvShows::TheITCrowd.quote,
    }
  end
  
  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  # test "should create post" do
  #   post posts_url, params: { post: @attrs }
  #   post = Post.find_by title: @attrs[:title]
  #   assert_redirected_to post_url(post)
  # end

  test "should edit post" do
    get edit_post_url(@post)
    assert_response :success  
  end

  test "should update post" do
    patch post_url(@post), params: { post: @attrs }
    assert_redirected_to post_url(@post)
    @post.reload
    assert { @post.title == @attrs[:title] }
  end

  test "should destroy post" do
    delete post_url(@post)
    assert { !Post.exists? @post.id }
    assert_redirected_to posts_url  
  end
end
