provider "google" {
credentials = "${file("cr-gcp-348307-152507cf30d0.json")}"
project = "cr-gcp-348307"
region = "us-west1"
}
resource "google_compute_instance" "nexus" {
  project      = "cr-gcp-348307"
  name         = "nexus"
  machine_type = "e2-medium"
  zone         = "us-west1-a"
  tags         = ["ssh", "port-8081"]
   boot_disk {
    initialize_params {
      image = "cr-nexus-image"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}

#resource "google_compute_instance" "jenkins" {
#  project      = "cr-gcp-348307"
#  name         = "jenkins"
#  machine_type = "e2-medium"
#  zone         = "us-west1-a"
#  tags         = ["ssh", "port-8080"]
#   boot_disk {
#    initialize_params {
#      image = "cr-jenkins"
#    }
#  }
#  network_interface {
#    network = "default"
#    access_config {
#    }
#  }
#}
resource "google_compute_instance" "prometheus" {
  project      = "cr-gcp-348307"
  name         = "prometheus"
  machine_type = "e2-medium"
  zone         = "us-west1-a"
  tags         = ["ssh", "port-9090"]
   boot_disk {
    initialize_params {
      image = "cr-prometheus-image"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}
resource "google_compute_instance" "sonarqube" {
  project      = "cr-gcp-348307"
  name         = "sonarqube"
  machine_type = "e2-medium"
  zone         = "us-west1-a"
  tags         = ["ssh", "port-9000"]
   boot_disk {
    initialize_params {
      image = "cr-sonar-image"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}
resource "google_compute_firewall" "allow-tcp" {
  name = "allow-tcp"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
resource "google_compute_firewall" "allow-port8081" {
  name = "allow-port8081"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["8081"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["port-8081"]
}
resource "google_compute_firewall" "allow-port8080" {
  name = "allow-port8080"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["port-8080"]
}
resource "google_compute_firewall" "allow-port9000" {
  name = "allow-port9000"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9000"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["port-9000"]
}
resource "google_compute_firewall" "allow-port9090" {
  name = "allow-port9090"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9090"]
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["port-9090"]
}