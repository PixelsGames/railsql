class AddFieldsToChoice < ActiveRecord::Migration[5.1]
  def change
    add_column :choices, :checked, :boolean, default: false
    add_column :choices, :correct, :boolean, default: false
  end
end
