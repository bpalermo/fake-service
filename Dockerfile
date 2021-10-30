FROM golang:1.17 as build-env

WORKDIR /go/src/app

COPY go.* ./
RUN go get -d -v ./...

COPY cmd/server /go/src/app
RUN go build -o /go/bin/app

FROM gcr.io/distroless/base
COPY --from=build-env /go/bin/app /
CMD ["/app"]