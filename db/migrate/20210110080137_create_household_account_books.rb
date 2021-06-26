class CreateHouseholdAccountBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :household_account_books do |t|
      t.date :worked_on
      t.string :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
