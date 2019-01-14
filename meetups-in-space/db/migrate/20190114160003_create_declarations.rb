class CreateDeclarations < ActiveRecord::Migration
  def change
      create_table :declarations do |t|
          t.string :subject, null: false
          t.text :body, null: false
          t.integer :uid, null: false

          t.timestamps null: false
      end
  end
end
