require 'pg'
require 'socket'
require 'timeout'

sck = TCPServer.open(1337)
conn = PG.connect( dbname: 'sqli', user: 'user', password: 'password', host: 'db', port: 5432 )
loop{
  begin
    client = sck.accept
    id = nil
    Timeout::timeout 5 do
      id = client.gets.chomp
    end

    conn.exec( "select content from articles where id=#{id}" ) do |result|
      result = result.to_a
      if result.empty?
        client.puts('[-] No results')
      else
        client.puts(result[0]['content'])
      end
    end
  rescue Exception => e
    p e
    p e.message
    p e.backtrace
  end
  client.close
}
