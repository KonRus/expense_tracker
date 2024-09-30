class AddNotesToExpenses < ActiveRecord::Migration[7.2]
  def change
    add_column :expenses, :notes, :text
  end
end
