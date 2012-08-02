class AddRemoteFieldsToTask < ActiveRecord::Migration
  def up
    add_column :tasks, :remote_id, :integer
    add_column :tasks, :remote_path, :string
    add_column :tasks, :state, :string
  end

  def down
    remove_column :tasks, :remote_id
    remove_column :tasks, :remote_path
    remove_column :tasks, :state
  end
end
