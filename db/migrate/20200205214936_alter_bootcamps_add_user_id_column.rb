class AlterBootcampsAddUserIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :bootcamps, :user_id, :integer
    add_index :bootcamps, :user_id
  end
end
