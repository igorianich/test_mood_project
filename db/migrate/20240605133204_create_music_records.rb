class CreateMusicRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :music_records do |t|
      t.string :title
      t.string :photo
      t.decimal :price
      t.text :description
      t.string :damage_assessment

      t.timestamps
    end
  end
end
