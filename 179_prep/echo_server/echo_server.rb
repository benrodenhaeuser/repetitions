require 'socket'

server = TCPServer.new("localhost", 3003)

loop do
  client = server.accept
  request = client.gets
  puts request
  client.puts "HTTP/1.1 200 OK" # status line
  client.puts "Content-Type: text/html\r\n\r\n" # a header
  client.puts request # response body echoing the request
  client.close
end
