class Studio < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :users
  validates :name, :price,:opening_time,:closing_time, :presence => true

end
