class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :rating
      t.string :img_url
      t.integer :trip_id

      t.timestamps
    end
  end
end
