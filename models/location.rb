# encoding: utf-8

class Location
  def initialize(data)
    @data = data
  end

  def country_code
    data['country_code']
  end

  def country
    data['country']
  end

  def city
    data['town']
  end

  def lat_long
    data['geo']['pairs'].split.map(&:to_f)
  end

  def lat_long_string
    lat_long.join(', ')
  end

  private

  attr_reader :data
end
