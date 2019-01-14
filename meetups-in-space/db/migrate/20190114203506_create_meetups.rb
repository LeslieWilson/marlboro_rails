class CreateMeetups < ActiveRecord::Migration
  def change
          create_table :meetups do |t|
              t.string :title, null: false
              t.text :body, null: false
              t.integer :uid, null: false


              t.timestamps null: false
      end
  end
end
