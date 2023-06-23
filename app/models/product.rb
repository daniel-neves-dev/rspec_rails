class Product < ApplicationRecord
  belongs_to :category

  validates :description,:price, :category_id, presence: true

  def full_description
    "#{self.description} - #{self.price}"
  end
end
