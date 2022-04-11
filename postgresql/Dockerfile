FROM ruby
RUN apt update -y && apt install -y libpq-dev && gem install pg && apt clean
ENTRYPOINT ["ruby","/app/ruby_client.rb"]
