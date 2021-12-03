class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.bigint :project_id
      t.string :text
      t.boolean :isCompleted

      t.timestamps
    end

    add_index :todos, :project_id
  end
end
