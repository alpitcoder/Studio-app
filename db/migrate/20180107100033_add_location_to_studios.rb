class AddLocationToStudios < ActiveRecord::Migration[5.1]
  def change
    add_column :studios, :location, :string
  end
end
