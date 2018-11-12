class CreateTripLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_landmarks do |t|
      t.integer :trip_id
      t.integer :landmark_id

      t.timestamps
    end
  end
end
