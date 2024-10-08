class CreateExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.string :title
      t.decimal :amount
      t.date :date
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
