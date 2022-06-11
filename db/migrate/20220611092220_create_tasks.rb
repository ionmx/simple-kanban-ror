class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :position
      t.references :column, null: false, foreign_key: true

      t.timestamps
    end
  end
end
