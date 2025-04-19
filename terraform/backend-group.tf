resource "yandex_alb_backend_group" "cw-netology" {
  name = "cw-netology"

  http_backend {
    name             = "web-backend"
    port             = 80
    target_group_ids = [yandex_compute_instance_group.web-netology.application_load_balancer[0].target_group_id]

    load_balancing_config {
      panic_threshold = 5
    }

    healthcheck {
      timeout          = "2s"
      interval         = "2s"
      healthcheck_port = 80
      http_healthcheck {
        path = "/"
      }
    }
  }
}

resource "yandex_alb_virtual_host" "cw-netology" {
  name           = "cw-netology"
  http_router_id = yandex_alb_http_router.cw-netology.id

  route {
    name = "route-to-web"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.cw-netology.id
        timeout          = "3s"
      }
    }
  }
}