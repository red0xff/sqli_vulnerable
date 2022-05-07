require 'mysql2'
require 'socket'
require 'timeout'

sck = TCPServer.open(1337)
conn = Mysql2::Client.new( database: 'sqli', username: 'user', password: 'password', host: 'db', port: 3306 )
loop{
  begin
    client = sck.accept
    id = nil
    Timeout::timeout 5 do
      id = client.gets.chomp
    end

    result = conn.query( "select content from articles where id=#{id}" ).to_a
    if result.empty?
      client.puts('[-] No results')
    else
      client.puts(result[0]['content'])
    end
  rescue Exception => e
    p e
    p e.message
    p e.backtrace
  end
  client.close if client && !client.closed?
}
