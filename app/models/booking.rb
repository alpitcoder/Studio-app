class Booking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :studio
  validates :start_time,:end_time, :presence => true

end
