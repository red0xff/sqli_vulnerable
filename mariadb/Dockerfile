FROM ruby
RUN apt update -y && apt install -y libmariadb-dev && gem install mysql2 && apt clean
ENTRYPOINT ["ruby","/app/ruby_client.rb"]
