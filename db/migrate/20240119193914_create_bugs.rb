class CreateBugs < ActiveRecord::Migration[7.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.string :b_type
      t.string :status
      t.date :deadline
      t.references :project, null: false, foreign_key: true
      t.references :developer, foreign_key: { to_table: :users }
      t.references :creater, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
