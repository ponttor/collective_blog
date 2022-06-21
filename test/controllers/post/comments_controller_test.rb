# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    @comment = post_comments(:one)
    @attrs = {
      content: Faker::TvShows::TheITCrowd.quote
    }
  end

  test 'should create comment' do
    post post_comments_url(@post), params: { post_comment: @attrs }
    assert_redirected_to @post
    comment = PostComment.find_by @attrs
    assert { comment }
  end

  test 'should update comment' do
    patch post_comment_path(@post, @comment), params: { post_comment: @attrs }
    assert_redirected_to @post
    @comment.reload
    assert { @attrs[:content] == @comment.content }
  end
end
