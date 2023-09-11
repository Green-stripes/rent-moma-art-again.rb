class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
  validates :end_date, comparison: { greater_than: :start_date }
end
