package main

import (
	"github.com/prometheus/client_golang/prometheus"
	"github.com/nik-johnson-net/prometheus-proxy"
	"github.com/nik-johnson-net/prometheus-envoy/pkg"
)

func factory(target string) prometheus.Collector {
	return pkg.NewEnvoyCollector(target)
}

var app = proxy.Application {
	CreateFactory: func() proxy.CollectorFactory {
		return factory
	},
}

func main() {
	proxy.Main(app)
}