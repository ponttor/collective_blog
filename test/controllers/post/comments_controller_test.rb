# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @post = posts(:one)
    @attrs = {
      content: Faker::TvShows::TheITCrowd.quote
    }
  end

  test 'create comment' do
    post post_comments_url(@post), params: { post_comment: @attrs }
    assert_redirected_to @post
    comment = PostComment.find_by @attrs
    assert { comment }
  end
end
