data "http" "get_my_ip" {
  url = "https://ifconfig.me/ip"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }

  lifecycle {
    postcondition {
      condition     = contains([200, 201, 204], self.status_code)
      error_message = "Status code invalid"
    }
  }
}
