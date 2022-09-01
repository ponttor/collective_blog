# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post1 = posts(:one)
    @post2 = posts(:two)
    @like1 = post_likes(:one)
  end

  test '#create like' do
    post post_likes_url(@post2)
    assert_equal(@post2.likes.count, 1)
    assert_redirected_to @post2
  end

  test '#destroy like' do
    delete post_like_url(@post1, @like1)
    like = PostLike.find_by(user: @user1, post: @post1)
    assert { !like }
    assert_redirected_to @post1
  end
end
