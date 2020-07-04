class Post < ApplicationRecord
  validates :title, :body, presence: true

  scope :published, -> { where(published: true) }

  def has_previous_published?
    Post.published.where("created_at < :date", date: created_at).order(:created_at).any?
  end

  def self.latest_published
    self.published.order(:created_at).last
  end

  def self.previous_published(post)
    Post.published.where("created_at < :date", date: post.created_at).order(:created_at).first
  end
end
