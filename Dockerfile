FROM golang:1.19 as builder

RUN mkdir -p /app
WORKDIR /app
COPY . /app/

RUN ls -all

RUN CGO_ENABLED=0 go build -o application main.go

FROM busybox
RUN mkdir -p /opt/color
COPY --from=builder /app/application /opt/color/application
EXPOSE 8081/tcp
ENTRYPOINT ["/opt/color/application"]
CMD ["serve"]
