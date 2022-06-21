# frozen_string_literal: true

class AddCategoryToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :category, null: false, foreign_key: true
  end
end
