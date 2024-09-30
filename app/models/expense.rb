class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :category_id, presence: true
  validates :payment_method, inclusion: { in: %w[Cash Credit\ Card Bank\ Transfer Other] }
end
