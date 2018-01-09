class Studio < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :users ,optional: true
  validates_uniqueness_of :name
  validates :name,:price,:opening_time,:closing_time,:location, :presence => true

end
