class AddColumnsToRecords < ActiveRecord::Migration
  def change
      add_column :records, :date, :date
      add_column :records, :title, :string
      add_column :records, :amount, :integer
  end
end
