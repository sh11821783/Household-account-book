class AddIncomeToHouseholdAccountBooks < ActiveRecord::Migration[5.1]
  def change
    # 収入（項目）
    add_column :household_account_books, :income, :string
    add_column :household_account_books, :income_1, :string
    add_column :household_account_books, :income_2, :string
    add_column :household_account_books, :income_3, :string
    add_column :household_account_books, :income_4, :string
    add_column :household_account_books, :income_5, :string
    add_column :household_account_books, :income_6, :string
    add_column :household_account_books, :income_7, :string
    add_column :household_account_books, :income_8, :string
    add_column :household_account_books, :income_9, :string
    add_column :household_account_books, :income_10, :string
    # 収入（整数）
    add_column :household_account_books, :income_n, :integer
    add_column :household_account_books, :income_n_1, :integer
    add_column :household_account_books, :income_n_2, :integer
    add_column :household_account_books, :income_n_3, :integer
    add_column :household_account_books, :income_n_4, :integer
    add_column :household_account_books, :income_n_5, :integer
    add_column :household_account_books, :income_n_6, :integer
    add_column :household_account_books, :income_n_7, :integer
    add_column :household_account_books, :income_n_8, :integer
    add_column :household_account_books, :income_n_9, :integer
    add_column :household_account_books, :income_n_10, :integer
    # 備考欄
    add_column :household_account_books, :income_note, :string
  end
end
