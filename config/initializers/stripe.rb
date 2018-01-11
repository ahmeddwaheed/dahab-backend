Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_DTW2OZE8qupG5zaPuWV02kpK'],
  :secret_key      => ENV['sk_test_tNcgNbSwpVhSvdE0NPaWrLXd']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]