class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :artist
      t.text :image
      t.integer :cost_per_day
      t.string :culture
      t.date :completion_date
      t.text :medium

      t.timestamps
    end
  end
end
