FROM ruby:2.7.2
WORKDIR /app/
ADD ruby_client.rb .
RUN apt update -y && apt install -y libpq-dev && gem install pg && apt clean
ENTRYPOINT ["ruby","/app/ruby_client.rb"]
