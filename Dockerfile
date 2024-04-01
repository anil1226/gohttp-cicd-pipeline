FROM golang:1.22 AS builder

WORKDIR /app
COPY ./main.go .
COPY ./go.mod .

RUN CGO_ENABLED=0 GOOS=linux go build -o app main.go

FROM alpine:latest AS producuction
RUN addgroup -S nonroot \
    && adduser -S nonroot -G nonroot
COPY --from=builder /app .
USER nonroot
EXPOSE 8080
CMD [ "./app" ]
