class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id', dependent: :delete_all
  has_many :likes, foreign_key: 'post_id', dependent: :delete_all

  after_save :update_post_counter
  after_destroy :decrement_post_counter

  def all_comments
    comments.includes([:author]).order(created_at: :desc)
  end

  def five_most_recent_comments
    all_comments.limit(5)
  end

  def update_post_counter
    author.increment!(:post_count)
  end

  def decrement_post_counter
    author.decrement!(:post_count)
  end

  validates :title, presence: true, length: { in: 2..250 }
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
