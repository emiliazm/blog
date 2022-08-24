class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def all_comments
    comments.includes([:author]).order(created_at: :desc)
  end

  def five_most_recent_comments
    all_comments.first(5)
  end

  def update_post_counter
    author.increment!(:post_count)
  end

  validates :title, presence: true, length: { in: 2..250 }
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
