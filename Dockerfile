FROM golang:1.19 as builder

RUN go build -o /app main.go

FROM busybox

COPY --from=builder ./app /app
ENTRYPOINT ["/app"]
