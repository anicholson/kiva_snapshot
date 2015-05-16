require 'spec_helper'

describe Location do
  let(:example_data) { {"country_code"=>"PE", "country"=>"Peru", "town"=>"Parcona", "geo"=>{"level"=>"town", "pairs"=>"-10 -76", "type"=>"point"} } }

  subject { Location.new(example_data) }

  describe "API" do
    [:country_code, :country, :city, :lat_long, :lat_long_string].each do |method|
      it { is_expected.to respond_to method }
    end
  end

  it "#country" do
    expect(subject.country).to eq('Peru')
  end

  it "#country_code" do
    expect(subject.country_code).to eq('PE')
  end

  it "#city" do
    expect(subject.city).to eq("Parcona")
  end

  it "#lat_long" do
    expect(subject.lat_long).to eq([-10.0, -76.0])
  end

  it "#lat_long_string" do
    expect(subject.lat_long_string).to eq("-10.0, -76.0")
  end
end
