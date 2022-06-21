# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy, class_name: 'PostComment'
  has_many :likes, dependent: :destroy, class_name: 'PostLike'
end
