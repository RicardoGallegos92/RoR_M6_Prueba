class AddColumnRoleToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :user, :role, :integer, default: 0
  end
end
