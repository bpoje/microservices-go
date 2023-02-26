## base go image
#FROM golang:1.18-alpine as builder
#
#RUN mkdir /app
#
#COPY . /app
#
#WORKDIR /app
#
##RUN export GOPROXY=direct
#
##RUN aptitude install curl && curl 'https://proxy.golang.org/github.com/francoispqt/gojay/@v/v1.2.13.mod'
#RUN apk update && apk add curl && curl 'https://proxy.golang.org/github.com/francoispqt/gojay/@v/v1.2.13.mod'
#
#RUN CGO_ENABLED=0 go build -o brokerApp ./cmd/api
#
#RUN chmod +x /app/brokerApp

# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

#COPY --from=builder /app/brokerApp /app
COPY brokerApp /app

CMD [ "/app/brokerApp" ]
