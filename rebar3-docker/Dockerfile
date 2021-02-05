FROM erlang:22

RUN apt-get update
RUN apt-get -y install bash

RUN mkdir /build
WORKDIR /build/

ADD https://s3.amazonaws.com/rebar3/rebar3 /build/
RUN chmod a+x /build/rebar3
