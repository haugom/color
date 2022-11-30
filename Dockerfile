FROM golang:1.19 as builder

COPY go.mod ./app/
COPY go.sum ./app/
COPY *.go ./app/
COPY cmd ./app/cmd
COPY internal /app/internal
WORKDIR /app

RUN ls -all

RUN go build -o /app/app main.go

FROM busybox

COPY --from=builder ./app /app
ENTRYPOINT ["/app"]
