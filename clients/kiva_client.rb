require 'bigdecimal'
require 'faraday'
require 'faraday_middleware'

class KivaClient
  def initialize
    @http = default_http_client
  end

  def user_balance
    parsed_response = http.get('/v1/my/balance.json').body
    {
      date: Date.today,
      balance: (BigDecimal.new(parsed_response['user_balance']['balance']) * 100).to_i
    }
  end

  def loans
    parsed_response = http.get('/v1/my/loans.json').body

    loan_ids = parsed_response['loans'].map {|loan| loan['id'] }.join(',')

    loan_info     = http.get("/v1/loans/#{loan_ids}.json").body['loans']
    loan_balances = http.get("/v1/my/loans/#{loan_ids}/balances.json").body['balances']

    combined_loan_and_balance_info(loan_info, loan_balances)
  end

  def stats
    http.get('/v1/my/stats.json').body.tap do |response|
      response['amount_of_loans'] = BigDecimal.new(String(response['amount_of_loans'] * 100))
      response['amount_repaid']   = BigDecimal.new(String(response['amount_repaid'] * 100))
    end
  end

  def raw(q)
    http.get(q).body
  end

  private

  attr_reader :http

  def combined_loan_and_balance_info(info, balances)
    info_ids    = Set.new(info.map {|loan_info| loan_info['id']})
    balance_ids = Set.new(info.map {|balance_info| balance_info['id']})

    ids_with_full_data = info_ids.union(balance_ids)

    answer = ids_with_full_data.inject({}) do |collection, id|
      collection[id] = {
        'data'     => with_id(info, id),
        'balances' => with_id(balances, id)
      }
      collection
    end
  end

  def with_id(collection, id)
    collection.select {|item| item['id'] == id }.first
  end

  def default_http_client
    Faraday.new(url: 'https://api.kivaws.org') do |faraday|
      faraday.request :oauth, kiva_oauth_credentials
      faraday.request :url_encoded
      faraday.response :json
      faraday.adapter Faraday.default_adapter
    end
  end

  def kiva_oauth_credentials
    {
      consumer_key:    ENV['CONSUMER_ID'],
      consumer_secret: ENV['CONSUMER_SECRET'],
      token:           ENV['ACCESS_TOKEN'],
      token_secret:    ENV['ACCESS_SECRET']
    }
  end
end
