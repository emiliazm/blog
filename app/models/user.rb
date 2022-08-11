class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def three_most_recent_posts
    posts.order(created_at: :desc).first(3)
  end

  validates :name, presence: true, length: { in: 2..25 }
  validates :post_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
