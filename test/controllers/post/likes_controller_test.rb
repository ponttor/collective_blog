# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @user = users(:one)
    @post_1 = posts(:one)
    @like_1 = post_likes(:one)
  end

  test '#create like' do
    post post_likes_url(@post_1)

    like = PostLike.find_by(user: @user, post: @post_1)
    assert { like }
  end

  test '#destroy like' do
    delete post_like_url(@post_1, @like_1)
    like = PostLike.find_by(user: @user, post: @post_1)
    assert { !like }
  end
end
