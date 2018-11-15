class AddDescriptionToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :description, :string
    add_column :places, :phone, :string
  end
end
