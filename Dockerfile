FROM golang:1.20.4 AS builder
WORKDIR /app
COPY go.mod *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-hello-go
CMD ["docker-hello-go"]

FROM scratch
WORKDIR /
COPY --from=builder docker-hello-go .
ENTRYPOINT [ "/docker-hello-go" ]