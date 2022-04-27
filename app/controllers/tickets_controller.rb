class TicketsController < ApplicationController
  def create_booking
    stripe_service = StripeService.new
    workshop_booking_params.merge!({ 
      workshop_fee: Workshop.first.registration_fee, 
      workshop_name: Workshop.first.name 
    })
    customer = stripe_service.create_customer(workshop_booking_params)
    redirect_to workshop_path(Workshop.first), notice: 'Customer has been created' 
  end

  private

  def workshop_booking_params
    params.permit!
  end
end
