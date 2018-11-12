class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.integer :location_id

      t.timestamps
    end
  end
end
