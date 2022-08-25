class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comments_counter
  after_destroy :decrement_comments_counter

  def update_comments_counter
    post.increment!(:comments_count)
  end

  def decrement_comments_counter
    post.decrement!(:comments_count)
  end
end
