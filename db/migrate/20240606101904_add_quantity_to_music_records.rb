class AddQuantityToMusicRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :music_records, :quantity, :integer, default: 0
  end
end
