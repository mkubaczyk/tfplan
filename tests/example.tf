#############
# addresses #
#############

resource "google_compute_address" "01" {
  name = "address01"
}

resource "google_compute_address" "02" {
  name = "address02"
}

############
# networks #
############

resource "google_compute_network" "01" {
  name = "network01"
  auto_create_subnetworks = true
}

resource "google_compute_network" "02" {
  name = "network02"
  auto_create_subnetworks = true
}
