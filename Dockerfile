FROM golang:1.17rc1-alpine3.14 as BUILDER
WORKDIR /app
COPY main.go .
RUN go build main.go

FROM hello-world
WORKDIR /app
COPY --from=BUILDER /app .
CMD ["./main"]