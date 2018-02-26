def file_list
  root = File.expand_path('..', __FILE__)
  matcher = root + '/files/*'
  Dir.glob(matcher).map do |file|
    File.basename(file)
  end
end

p file_list


=begin

make files editable DONE

- build edit template DONE
  - form with textarea DONE
  - textarea preloaded with current text for editing. DONE
  - form posts to /edit/:filename DONE

- build file edit get route (get '/edit/:filename') DONE
  - renders the edit template DONE

- build file edit post route (post '/edit/:filename') DONE
  - updates the file in the filesystem DONE
  - redirects to index DONE

- link edit view from index template DONE

=end
