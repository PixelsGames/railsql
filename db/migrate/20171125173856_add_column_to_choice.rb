class AddColumnToChoice < ActiveRecord::Migration[5.1]
  def change
    add_column :choices, :body, :string
  end
end
