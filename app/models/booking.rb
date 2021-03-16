class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  belongs_to :room

  scope :rooms_booked, (lambda do |start_date, end_date|
    select(:room_id)
    .where(deleted: 0)
    .where("(?)<=end_date and(?)>=start_date", start_date, end_date)
  end)

  # all room having booking for admin manage booking
  scope :room_ids_in_booking, (lambda do
    select(:room_id)
    .where(deleted: 0)
  end)

  scope :order_booking_news, (lambda do
    select(:room_id)
    .order(id: :desc)
  end)
end
