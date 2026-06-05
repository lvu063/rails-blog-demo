class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  CATEGORIES = %w[Technology Finance Economics Policy Other].freeze

  validates :title,    presence: true, length: { minimum: 3, maximum: 100 }
  validates :body,     presence: true, length: { minimum: 10 }
  validates :category, inclusion: { in: CATEGORIES, message: "must be a valid category" }

  scope :by_category, ->(cat) { where(category: cat) if cat.present? }
  scope :recent,      -> { order(created_at: :desc) }
end