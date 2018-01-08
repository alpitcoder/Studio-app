class Studio < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :users
  validates_uniqueness_of :name
  validates :price,:opening_time,:closing_time,:location, :presence => true

end
