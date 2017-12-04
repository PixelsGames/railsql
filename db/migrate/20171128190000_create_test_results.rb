class CreateTestResults < ActiveRecord::Migration[5.1]
  def change
    create_table :test_results do |t|
      t.boolean :complex
      t.integer :user_id

      t.timestamps
    end
  end
end
