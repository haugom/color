FROM golang:1.19 as builder

RUN mkdir -p /app
WORKDIR /app
COPY . /app/

RUN ls -all

RUN go build -o application main.go

FROM busybox
COPY --from=builder /app/application /usr/local/bin/application
ENTRYPOINT ["/usr/local/bin/application"]
