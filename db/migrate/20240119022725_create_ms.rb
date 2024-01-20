class CreateMs < ActiveRecord::Migration[7.1]
  def change
    create_table :ms do |t|

      t.timestamps
    end
  end
end
