FROM tinygo/tinygo:0.27.0 as builder

WORKDIR /app
COPY main.go .

RUN tinygo build -o hello main.go

FROM scratch

COPY --from=builder /app/hello .

CMD ["./hello"]