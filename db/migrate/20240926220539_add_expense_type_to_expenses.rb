class AddExpenseTypeToExpenses < ActiveRecord::Migration[7.2]
  def change
    add_column :expenses, :expense_type, :string
  end
end
