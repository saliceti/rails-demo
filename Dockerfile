FROM ruby:2.3.3-slim

RUN gem install bundler --no-document
RUN apt-get update
RUN apt-get install -y build-essential libpq-dev libsqlite3-dev nodejs
WORKDIR /app
ADD . .
RUN bundle
EXPOSE 3000

# Example start command:
# docker run --name rails-demo --rm -p 3000:3000 rails-demo bash -c "bin/rails db:migrate && exec bin/rails server -b 0.0.0.0"

# Run in Cloudfoundry using manifest.yml:
# cf push -o saliceti/rails-demo

# Run in Cloudfoundry from anywhere:
# cf push rails-demo -o saliceti/rails-demo -c "bin/rails db:migrate && bin/rails server -b 0.0.0.0"
