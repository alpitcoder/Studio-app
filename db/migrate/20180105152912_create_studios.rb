class CreateStudios < ActiveRecord::Migration[5.1]
  def change
    create_table :studios do |t|
      t.string :name
      t.datetime :opening_time
      t.datetime :closing_time
      t.string :studio_type
      t.integer :price


      t.timestamps
    end
  end
end
