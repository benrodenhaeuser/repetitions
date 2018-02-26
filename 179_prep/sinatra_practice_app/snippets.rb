def file_list
  root = File.expand_path('..', __FILE__)
  matcher = root + '/files/*'
  Dir.glob(matcher).map do |file|
    File.basename(file)
  end
end

p file_list
