FROM ruby
RUN apt update -y && apt install -y libsqlite3-dev && gem install sqlite3 && apt clean
ENTRYPOINT ["ruby","/app/ruby_client.rb"]
