class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy, class_name: 'PostComment'
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
