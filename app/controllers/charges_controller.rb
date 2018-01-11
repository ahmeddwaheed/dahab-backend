class ChargesController < ApplicationController

    def create
        
        Stripe.api_key = "sk_test_tNcgNbSwpVhSvdE0NPaWrLXd"

        # Token is created using Checkout or Elements!
        # Get the payment token ID submitted by the form:
        token = params[:stripeToken]
        amount = params[:amount]
        currency = params[:currency]
        # Charge the user's card:
        
        charge = Stripe::Charge.create(
          :amount => amount,
          :currency => currency,
          :description => "Example charge",
          :source => token
        )
    end
end
