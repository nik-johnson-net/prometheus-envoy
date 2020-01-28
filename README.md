# Enphase Envoy Golang Client

This is a prometheus collector for pulling metrics from an Envoy Enphase unit.

<https://enphase.com/en-us/support/what-envoy>

## Example

```yml
  - job_name: 'prometheus-smarthome'
    static_configs:
      - targets:
        - '192.168.1.40'
        - '192.168.1.41'
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: 127.0.0.1:2112  # The prometheus-smarthome's real hostname:port.
```

## License

This library is provided under the [MIT License](LICENSE.md)
