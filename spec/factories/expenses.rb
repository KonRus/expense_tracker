FactoryBot.define do
  factory :expense do
    title { "Test Expense" }
    amount { 100.50 }
    date { Date.today }
    payment_method { "Cash" }
    notes { "Test notes" }
    association :category
    association :user
  end
end
