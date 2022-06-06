module ApplicationHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      if comment.is_root?
        render 'posts/comments/comments', comment: comment
      else
        render 'posts/comments/nested', comment: comment
      end
    end.join.html_safe
  end
end
