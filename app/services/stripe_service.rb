require 'stripe'

class StripeService
  def initialize()
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  end

  def create_customer(data)
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
              amount: (data[:no_of_sits].to_i * data[:workshop_fee]) * 100,
              currency: 'usd',
              source: token.id,
              description: "Payment for #{data[:workshop_name]}",
            })


    customer
  end
end
