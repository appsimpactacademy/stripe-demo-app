require 'stripe'

class StripeService
  def initialize()
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  end

  def create_customer(data)
    amount_to_be_paid = data[:no_of_sits].to_i * data[:workshop_fee]
    # create stripe customer
    customer = Stripe::Customer.create({
                 name: data[:full_name],
                 email: data[:email],
                 phone: data[:contact_number] 
               })

    # create token for stripoe card
    token = Stripe::Token.create({
              card: {
                number: data[:card_number].to_s,
                exp_month: data[:month],
                exp_year: data[:year],
                cvc: data[:cvv].to_s
              }
            })

    # create stripe charge for customer
    charge = Stripe::Charge.create({
              amount: (amount_to_be_paid) * 100,
              currency: 'usd',
              source: token.id,
              description: "Payment for #{data[:workshop_name]}",
            })

    booking = WorkshopBooking.create(
      stripe_customer_id: customer.id,
      stripe_charge_id: charge.id,
      tickets_booked: data[:no_of_sits].to_i,
      amount_paid: amount_to_be_paid,
      workshop_id: Workshop.first.id
    )
    customer
  end
end
