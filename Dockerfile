FROM golang:1.19 as builder

RUN mkdir -p /app
WORKDIR /app
COPY . /app/

RUN ls -all

RUN go build -o /app/app main.go

FROM busybox

COPY --from=builder ./app /app
ENTRYPOINT ["/app"]
