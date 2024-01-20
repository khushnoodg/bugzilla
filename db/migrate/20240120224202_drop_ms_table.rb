class DropMsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :ms
  end
end
