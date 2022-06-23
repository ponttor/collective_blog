# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, inverse_of: :creator, foreign_key: :creator_id, dependent: :destroy
  has_many :comments, dependent: :destroy, class_name: 'PostComment'
  has_many :likes, dependent: :destroy, class_name: 'PostLike'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
