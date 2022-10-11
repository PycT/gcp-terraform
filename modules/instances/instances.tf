# CHECK THE MACHINE TYPE!
# resource "google_compute_instance" "tf_instance_1" {
#   name                      = "tf-instance-1"
#   machine_type = "n1-standard-1"
#   boot_disk {
#     initialize_params {
#         image = "cloud-debian/debian-10"
#     }
#   } 
#   network_interface {
#     network = var.vpcName
#   }
#   metadata_startup_script = "metadata_startup_script = <<-EOT   #!/bin/bash   EOT"
#   allow_stopping_for_update = true
# }

# resource "google_compute_instance" "tf_instance_2" {
#   name                      = "tf-instance-2"
#   machine_type = "n1-standard-1"
#   boot_disk {
#     initialize_params {
#         image = "cloud-debian/debian-10"
#     }
#   } 
#   network_interface {
#     network = var.vpcName
#   }
#   metadata_startup_script = "metadata_startup_script = <<-EOT   #!/bin/bash   EOT"
#   allow_stopping_for_update = true
# }