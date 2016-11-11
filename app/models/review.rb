class Review < ActiveRecord::Base
  belongs_to :product

  validates :product_id, :user_id, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { maximum: 250}
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
end
