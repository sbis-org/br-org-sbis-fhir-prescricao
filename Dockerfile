FROM ruby:3.1.3

WORKDIR /app

RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get install -y nodejs && \
    apt-get install -y npm   

RUN gem install jekyll

RUN npm update

RUN mkdir -p /root/.fhir/packages

COPY . /app

RUN ./_updatePublisher.sh -y

CMD ["./_genonce.sh"]