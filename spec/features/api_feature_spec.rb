require 'spec_helper'

describe 'API access', rack_test: true do
  it 'denies access without a session' do
    get '/api/stats.json', {}, 'rack.session' => nil

    expect(last_response.status).to eq(404)
  end

  it 'allows access when a session exists' do
    get '/api/stats.json', {}, 'rack.session' => { logged_in: true }

    expect(last_response.status).to eq(200)
  end
end
