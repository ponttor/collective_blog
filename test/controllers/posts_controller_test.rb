# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @category = categories(:one)
    @attrs = {
      title: Faker::TvShows::TheITCrowd.character,
      body: Faker::TvShows::TheITCrowd.quote,
      category_id: @category.id
    }
  end

  test 'show posts' do
    get root_url
    assert_response :success
  end

  test 'show one post' do
    get post_url(@post)
    assert_response :success
  end

  test 'get new post' do
    sign_in users(:one)

    get new_post_url
    assert_response :success
  end

  test 'create new post' do
    sign_in users(:one)

    post posts_url, params: { post: @attrs }
    post = Post.find_by @attrs
    assert_redirected_to post_url(post)
    assert { post }
  end

  test 'create new post without title' do
    sign_in users(:one)

    @attrs[:title] = nil
    post posts_url, params: { post: @attrs }
    post = Post.find_by @attrs

    assert_response :unprocessable_entity
    assert { !post }
  end
end
