class CreateArticle < ActiveRecord::Migration
  def change
      create_table :articles do |t|
          t.string :subject, null: false
          t.text :story, null: false

          t.timestamps null: false
      end
    end
end
