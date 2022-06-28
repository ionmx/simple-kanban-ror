class CreateColumns < ActiveRecord::Migration[7.0]
  def change
    create_table :columns do |t|
      t.string :title
      t.integer :position
      t.references :board, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
