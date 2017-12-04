class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :lesson_id

      t.timestamps
    end

    create_table :questions_variants, id: false do |t|
      t.belongs_to :question, index: true
      t.belongs_to :variant,  index: true
    end
  end
end
