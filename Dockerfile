FROM golang:1.22 AS builder

WORKDIR /app
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o app main.go

FROM alpine:latest AS producuction
COPY --from=builder /app .
CMD [ "./app" ]
