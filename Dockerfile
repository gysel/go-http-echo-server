# BUILDER
FROM golang:1.15 as builder

WORKDIR /build
COPY echoserver.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -v -o echoserver

# IMAGE
FROM alpine:3
RUN apk add --no-cache ca-certificates

COPY --from=builder /build/echoserver /app/echoserver

ENV PORT=8080
EXPOSE 8080

CMD ["/app/echoserver"]