class AddFixedCostToHouseholdAccountBooks < ActiveRecord::Migration[5.1]
  def change
    # 固定費カラム
    add_column :household_account_books, :fixed_cost, :string # 家賃
    add_column :household_account_books, :fixed_cost_1, :string # 電気代
    add_column :household_account_books, :fixed_cost_2, :string # ガス代
    add_column :household_account_books, :fixed_cost_3, :string # 水道
    add_column :household_account_books, :fixed_cost_4, :string # インターネット料金
    add_column :household_account_books, :fixed_cost_5, :string # 携帯代
    add_column :household_account_books, :fixed_cost_6, :string # NHK料金
    add_column :household_account_books, :fixed_cost_7, :string # 保険料
    add_column :household_account_books, :fixed_cost_8, :string # 年金
    add_column :household_account_books, :fixed_cost_9, :string # 国保
    add_column :household_account_books, :fixed_cost_10, :string # ローン
    add_column :household_account_books, :fixed_cost_11, :string # 習い事
    add_column :household_account_books, :fixed_cost_12, :string # 月極駐車場料金
    add_column :household_account_books, :fixed_cost_13, :string # 貯金
    add_column :household_account_books, :fixed_cost_14, :string # お小遣い
    add_column :household_account_books, :fixed_cost_15, :string # 教育費
    add_column :household_account_books, :fixed_cost_16, :string
    add_column :household_account_books, :fixed_cost_17, :string
    add_column :household_account_books, :fixed_cost_18, :string
    add_column :household_account_books, :fixed_cost_19, :string
    add_column :household_account_books, :fixed_cost_20, :string
    add_column :household_account_books, :fixed_n, :integer # 家賃（整数）
    add_column :household_account_books, :fixed_n_1, :integer # 電気代（整数）
    add_column :household_account_books, :fixed_n_2, :integer # ガス代（整数）
    add_column :household_account_books, :fixed_n_3, :integer # 水道（整数）
    add_column :household_account_books, :fixed_n_4, :integer # インターネット料金（整数）
    add_column :household_account_books, :fixed_n_5, :integer # 携帯代（整数）
    add_column :household_account_books, :fixed_n_6, :integer # NHK料金（整数）
    add_column :household_account_books, :fixed_n_7, :integer # 保険料（整数）
    add_column :household_account_books, :fixed_n_8, :integer # 年金（整数）
    add_column :household_account_books, :fixed_n_9, :integer # 国保（整数）
    add_column :household_account_books, :fixed_n_10, :integer # ローン（整数）
    add_column :household_account_books, :fixed_n_11, :integer # 習い事（整数）
    add_column :household_account_books, :fixed_n_12, :integer # 月極駐車場料金（整数）
    add_column :household_account_books, :fixed_n_13, :integer # 貯金（整数）
    add_column :household_account_books, :fixed_n_14, :integer # お小遣い（整数）
    add_column :household_account_books, :fixed_n_15, :integer # 教育費（整数）
    add_column :household_account_books, :fixed_n_16, :integer
    add_column :household_account_books, :fixed_n_17, :integer
    add_column :household_account_books, :fixed_n_18, :integer
    add_column :household_account_books, :fixed_n_19, :integer
    add_column :household_account_books, :fixed_n_20, :integer
  end
end
