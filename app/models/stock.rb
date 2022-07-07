class Stock < ApplicationRecord

  #class method - no dependency on instance variable
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      secret_token: Rails.application.credentials.iex_client[:sandbox_secret_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1')
    client.price(ticker_symbol)
  end
end
