%w(clients models workers).each do |app_directory|
  path = Pathname.new(__FILE__).join(app_directory, '**', '*.rb')

  Dir.glob(path).each do |application_file|
    puts application_file
    require application_file
  end
end
