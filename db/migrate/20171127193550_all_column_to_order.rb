class AllColumnToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :processed, :boolean
  end
end
