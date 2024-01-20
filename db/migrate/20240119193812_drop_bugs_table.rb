class DropBugsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :bugs
  end
end
