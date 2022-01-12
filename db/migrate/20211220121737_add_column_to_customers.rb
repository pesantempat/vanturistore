class AddColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :verification_code, :string
    add_column :customers, :is_verified, :boolean, :default => false
  end
end
