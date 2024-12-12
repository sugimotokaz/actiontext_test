class Article < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true, length: { maximum: 50 }
end
