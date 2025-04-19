resource "yandex_alb_http_router" "cw-netology" {
  name = "cw-netology"
}

resource "yandex_alb_load_balancer" "cw-netology" {
  name               = "cw-netology"
  network_id         = yandex_vpc_network.vpc.id
  security_group_ids = [yandex_vpc_security_group.load-balancer.id]

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.private-web-a.id
    }

    location {
      zone_id   = "ru-central1-b"
      subnet_id = yandex_vpc_subnet.private-web-b.id
    }

    location {
      zone_id   = "ru-central1-d"
      subnet_id = yandex_vpc_subnet.private-web-c.id
    }
  }

  listener {
    name = "alb-http-listener"
    endpoint {
      address {
        external_ipv4_address {}
      }
      ports = [80]
    }

    http {
      handler {
        http_router_id = yandex_alb_http_router.cw-netology.id
      }
    }
  }

  depends_on = [
    yandex_vpc_security_group_rule.lb-access,
    yandex_vpc_security_group_rule.lb-healthchecks
  ]
}