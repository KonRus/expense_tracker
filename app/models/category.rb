class Category < ApplicationRecord
  has_many :expenses
  validates :name, presence: true
  has_paper_trail
end
