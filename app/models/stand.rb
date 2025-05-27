class Stand < ApplicationRecord
  belongs_to :vendor

  validates :height, presence: true, numericality: { greater_than: 0 }
  validates :width, presence: true, numericality: { greater_than: 0 }
  validates :depth, presence: true, numericality: { greater_than: 0 }

  has_paper_trail
end
