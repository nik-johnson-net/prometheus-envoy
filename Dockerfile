FROM golang:1.18-alpine AS build
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY . ./
RUN go build -o /prometheus-envoy ./cmd/prometheus-envoy

FROM gcr.io/distroless/base-debian10
WORKDIR /
COPY --from=build /prometheus-envoy /prometheus-envoy
EXPOSE 2112
USER nonroot:nonroot
ENTRYPOINT ["/prometheus-envoy"]
