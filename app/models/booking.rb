class Booking < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :studio
end
