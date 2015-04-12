require 'spec_helper'

describe 'site authentication', type: :feature do
  let(:logged_in) { { 'rack.session' => { logged_in: true } } }
  let(:not_logged_in) { { 'rack.session' => nil } }

  before { subject }
  context 'when not logged in' do
    let(:session) { not_logged_in }

    it 'redirects me to the login page' do
      get '/', {}, session
      expect(last_response).to be_redirect
    end

    it 'displays the login page without redirect' do
      get '/login', {}, session
      expect(last_response).not_to be_redirect
    end
  end

  context 'when logged in' do
    let(:session) { logged_in }

    it 'displays the home page without redirect' do
      get '/', {}, session
      expect(last_response).not_to be_redirect
    end

    it 'displays the login page without redirect' do
      get '/login', {}, session
      expect(last_response).not_to be_redirect
    end
  end
end
