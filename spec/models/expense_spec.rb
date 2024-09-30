require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  it "is valid with valid attributes" do
    expense = Expense.new(
      title: "Test Expense",
      amount: 100.5,
      date: Date.today,
      category: category,
      payment_method: "Cash",
      notes: "Some notes",
      user: user
    )
    expect(expense).to be_valid
  end

  it "is not valid without a title" do
    expense = Expense.new(title: nil)
    expect(expense).to_not be_valid
  end

  it "is not valid without an amount" do
    expense = Expense.new(amount: nil)
    expect(expense).to_not be_valid
  end
end
