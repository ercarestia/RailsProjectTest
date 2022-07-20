FROM public.ecr.aws/docker/library/ruby:3.1.2
WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential cmake postgresql-client

RUN curl -fsSL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs
RUN npm install yarn -g

COPY . .

RUN gem install bundler
RUN bundle install

EXPOSE 3000
EXPOSE 1234
EXPOSE 26162
CMD ["rails", "server", "-b", "0.0.0.0"]


