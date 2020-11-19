FROM ruby:2.7.2
WORKDIR /app/
ADD ruby_client.rb .
RUN apt update -y && apt install -y libmariadb-dev && gem install mysql2 && apt clean
ENTRYPOINT ["ruby","/app/ruby_client.rb"]
