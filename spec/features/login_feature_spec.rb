require 'spec_helper'

describe 'Logging into the site', type: :feature do
  describe 'visiting the home page' do
    subject { get '/', {}, session }

    before { subject }

    context 'when not logged in' do
      let(:session) { {'rack.session' => nil} }

      it 'redirects me to the login page' do
        expect(last_response).to be_redirect
      end
    end

    context 'when logged in' do
      let(:session) { {'rack.session' => { logged_in: true}} }
      it 'displays the home page immediately' do
        expect(last_response).not_to be_redirect
      end
    end
  end
end
