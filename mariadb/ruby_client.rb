require 'mysql2'
require 'socket'
sck = TCPServer.open(1337)
conn = Mysql2::Client.new( database: 'sqli', username: 'user', password: 'password', host: 'db', port: 3306 )
loop{
  begin
    client = sck.accept
    id = client.gets.chomp
    result = conn.query( "select content from articles where id=#{id}" ).to_a
    if result.empty?
      client.puts('[-] No results')
    else
      p client
      client.puts(result[0]['content'])
    end
  rescue Exception => e
    p e
    p e.message
    p e.backtrace
  end
  client.close if client && !client.closed?
}
