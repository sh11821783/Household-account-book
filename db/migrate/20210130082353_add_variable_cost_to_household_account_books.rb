class AddVariableCostToHouseholdAccountBooks < ActiveRecord::Migration[5.1]
  def change
    # 変動費カラム
    add_column :household_account_books, :variable_cost, :string # 家賃
    add_column :household_account_books, :variable_cost_1, :string # 電気代
    add_column :household_account_books, :variable_cost_2, :string # ガス代
    add_column :household_account_books, :variable_cost_3, :string # 水道
    add_column :household_account_books, :variable_cost_4, :string # インターネット料金
    add_column :household_account_books, :variable_cost_5, :string # 携帯代
    add_column :household_account_books, :variable_cost_6, :string # NHK料金
    add_column :household_account_books, :variable_cost_7, :string # 保険料
    add_column :household_account_books, :variable_cost_8, :string # 年金
    add_column :household_account_books, :variable_cost_9, :string # 国保
    add_column :household_account_books, :variable_cost_10, :string # ローン
    add_column :household_account_books, :variable_cost_11, :string # 習い事
    add_column :household_account_books, :variable_cost_12, :string # 月極駐車場料金
    add_column :household_account_books, :variable_cost_13, :string # 貯金
    add_column :household_account_books, :variable_cost_14, :string # お小遣い
    add_column :household_account_books, :variable_cost_15, :string # 教育費
    add_column :household_account_books, :variable_cost_16, :string
    add_column :household_account_books, :variable_cost_17, :string
    add_column :household_account_books, :variable_cost_18, :string
    add_column :household_account_books, :variable_cost_19, :string
    add_column :household_account_books, :variable_cost_20, :string
    # 変動費（整数）
    add_column :household_account_books, :variable_n, :integer
    add_column :household_account_books, :variable_n_1, :integer
    add_column :household_account_books, :variable_n_2, :integer
    add_column :household_account_books, :variable_n_3, :integer
    add_column :household_account_books, :variable_n_4, :integer
    add_column :household_account_books, :variable_n_5, :integer
    add_column :household_account_books, :variable_n_6, :integer
    add_column :household_account_books, :variable_n_7, :integer
    add_column :household_account_books, :variable_n_8, :integer
    add_column :household_account_books, :variable_n_9, :integer
    add_column :household_account_books, :variable_n_10, :integer
    add_column :household_account_books, :variable_n_11, :integer
    add_column :household_account_books, :variable_n_12, :integer
    add_column :household_account_books, :variable_n_13, :integer
    add_column :household_account_books, :variable_n_14, :integer
    add_column :household_account_books, :variable_n_15, :integer
    add_column :household_account_books, :variable_n_16, :integer
    add_column :household_account_books, :variable_n_17, :integer
    add_column :household_account_books, :variable_n_18, :integer
    add_column :household_account_books, :variable_n_19, :integer
    add_column :household_account_books, :variable_n_20, :integer
    # 備考欄
    add_column :household_account_books, :variable_note, :string
  end
end
