class DropCreateSongs < ActiveRecord::Migration[5.0]
  def change
    drop_table :songs
  end
end
