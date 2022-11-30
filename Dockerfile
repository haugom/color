FROM golang:1.19 as builder

COPY go.mod ./
COPY go.sum ./
COPY *.go ./
COPY cmd ./cmd
COPY internal /internal

RUN go build -o /app main.go

FROM busybox

COPY --from=builder ./app /app
ENTRYPOINT ["/app"]
