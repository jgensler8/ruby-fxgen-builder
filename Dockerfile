FROM ruby:2.1

ENV TRAVELING_RUBY_VERSION "20150210-2.1.5"
ENV TRAVELING_RUBY_TARGET "linux-x86_64"
WORKDIR /ruby
RUN curl -L -O --fail https://d6r77u77i8pq3.cloudfront.net/releases/traveling-ruby-${TRAVELING_RUBY_VERSION}-${TRAVELING_RUBY_TARGET}.tar.gz && \
  tar -xzf traveling-ruby-${TRAVELING_RUBY_VERSION}-${TRAVELING_RUBY_TARGET}.tar.gz -C /ruby && \
  rm traveling-ruby-${TRAVELING_RUBY_VERSION}-${TRAVELING_RUBY_TARGET}.tar.gz
RUN apt-get update && \
  apt-get install -y zip
COPY zip /zip
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh"]
CMD ["/entrypoint.sh"]
