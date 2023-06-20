class Order < ApplicationRecord
  belongs_to :customer, dependent: :destroy
end
