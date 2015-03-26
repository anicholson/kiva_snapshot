%w(clients workers).each do |dir|
  Dir.glob(Pathname.new(__FILE__).join('..', '..', dir, '**', '*.rb')).each do |file|
    require file
  end
end
