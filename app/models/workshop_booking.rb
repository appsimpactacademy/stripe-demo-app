class WorkshopBooking < ApplicationRecord
  belongs_to :workshop

  after_create :update_workshop_remaining_sits

  def update_workshop_remaining_sits
    workshop.update(remaining_sits: workshop.total_sits - tickets_booked)
  end
end
