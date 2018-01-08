class AddStudioRefToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :studio, foreign_key: true
  end
end
