FROM ruby
WORKDIR /app/
RUN apt update -y && apt install -y freetds-bin freetds-dev && gem install tiny_tds && apt clean
ENTRYPOINT ["ruby","/app/ruby_client.rb"]
