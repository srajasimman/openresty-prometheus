![image](https://github.com/user-attachments/assets/4acbd053-18a6-4963-9ef7-ff8201507d36)

# OpenResty/Nginx monitoring with Prometheus
openresty-prometheus is a module to monitor the Nginx web server and reverse-proxy using Prometheus and Grafana. This tool allows you to collect and visualize various Nginx metrics to ensure your server is running optimally.

## Features
- **nginx_http_requests_total**: Number of HTTP requests with hostname, HTTP status, request method, and cache status.
- **nginx_http_request_duration_seconds**: HTTP request latency with hostname.
- **nginx_http_connections**: Number of HTTP connections with statuses like active, reading, waiting, and writing.

## Prerequisites
- Docker
- Docker Compose
- Nginx
- Prometheus
- Grafana

## Getting Started
Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

## Installation
1. Clone the repository:

```sh
git clone https://github.com/srajasimman/openresty-prometheus.git
cd openresty-prometheus
```
2. Build the Docker image:

```sh
docker build -t openresty-prometheus .
```
3. Run the Docker container:

```sh
docker run -d -p 80:80 -p 9145:9145 openresty-prometheus
```

## Configuration

1. Update your Nginx configuration to include the Prometheus configuration. Replace the default configuration file with the `prometheus.conf` provided in this repository.

```sh
cp prometheus.conf /etc/nginx/conf.d/
```
2. Ensure the Prometheus scrape configuration includes the Nginx metrics endpoint:

```yaml
scrape_configs:
  - job_name: 'nginx'
    static_configs:
      - targets: ['<nginx-server-ip>:9145']
```

## Usage
Once your Docker container is running, you can access the metrics at:

```sh
curl -s "http://<your-server-ip>:9145/metrics"
```

## Visualization with Grafana
1. Add Prometheus as a data source in Grafana.
2. Import or create dashboards using the collected Nginx metrics:
    - `nginx_http_requests_total`
    - `nginx_http_request_duration_seconds`
    - `nginx_http_connections`

## Metrics

### nginx_http_requests_total
- **Description**: Total number of HTTP requests.
- **Labels**: hostname, status, method, cache_status
### nginx_http_request_duration_seconds
- **Description**: Duration of HTTP requests in seconds.
- **Labels**: hostname
### nginx_http_connections
- **Description**: Current number of HTTP connections.
- **Labels**: status (active, reading, waiting, writing)

## Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project.
2. Create your Feature Branch (git checkout -b feature/AmazingFeature).
3. Commit your Changes (git commit -m 'Add some AmazingFeature').
4. Push to the Branch (git push origin feature/AmazingFeature).
5. Open a Pull Request.

## License
Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## Acknowledgments
- [OpenResty](https://openresty.org/)
- [Prometheus](https://prometheus.io/)
- [Grafana](https://grafana.com/)

For more details, visit the [openresty-prometheus](https://github.com/srajasimman/openresty-prometheus) repository.

---

Feel free to reach out if you have any questions or need further assistance!

Happy monitoring!
