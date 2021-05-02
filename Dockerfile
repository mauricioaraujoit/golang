FROM golang:alpine AS builder

LABEL maintainer="Mauricio Araujo"

WORKDIR /src/

COPY app.go . /src/

RUN CGO_ENABLED=0 go build -o /go/app

FROM scratch

COPY --from=builder /go/app /go/app

CMD ["/go/app"]
