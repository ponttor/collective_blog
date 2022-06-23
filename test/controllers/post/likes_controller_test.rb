# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @user = users(:one)
    @post1 = posts(:one)
    @like1 = post_likes(:one)
  end

  test '#create like' do
    post post_likes_url(@post1)

    like = PostLike.find_by(user: @user, post: @post1)
    assert { like }
  end

  test '#destroy as User' do
    delete post_like_url(@post1, @like1)
    like = PostLike.find_by(user: @user, post: @post1)
    assert { !like }
  end
end
