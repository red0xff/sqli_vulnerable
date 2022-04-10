require 'tiny_tds'
require 'socket'
sck = TCPServer.open(1337)
conn = TinyTds::Client.new username: 'sa', password: 'anything123!', host: 'localhost', database: 'myapp'
loop{
  begin
    client = sck.accept
    id = client.gets.chomp
    puts "[*] id = #{id}"
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
