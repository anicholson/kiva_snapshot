require 'spec_helper'

describe 'logging into the site', type: :feature, js: true do
  before(:each) { visit '/login' }

  it 'accepts the hard-coded password' do
    fill_in 'Password', with: ENV['LOGIN_PASSWORD']
    click_on 'Log in'

    expect(current_path).to eq('/')
  end

  it 'does not accept anything else' do
    fill_in 'Password', with: 'nonsense'
    click_on 'Log in'

    expect(current_path).to eq('/login')
  end
end
