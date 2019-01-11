class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :genre, :string
  end
