class AddDefaultDoneToTodos < ActiveRecord::Migration[5.1]
  def change
     change_column :todos, :done, :boolean, default: false
  end
end
