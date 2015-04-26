require 'spec_helper'

describe User do
  it 'requires a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
end
