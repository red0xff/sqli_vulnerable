require 'tiny_tds'
require 'socket'
require 'timeout'

HOST = 'mssql_server'

sck = TCPServer.open(1337)
conn = TinyTds::Client.new username: 'sa', password: 'anything123!', host: HOST, database: 'myapp'
loop{
  begin
    client = sck.accept
    id = nil
    Timeout::timeout 5 do
      id = client.gets.chomp
    end

    $stderr.puts(id)
    result = conn.execute( "select content from articles where id=#{id}" ).to_a
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
