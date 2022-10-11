# CHECK THE MACHINE TYPE!
# resource "google_compute_instance" "tf_instance_1" {
#   name = "tf-instance-1"
#   machine_type = "n1-standard-1"
#   zone = var.zone
#   boot_disk {
#     initialize_params {
#         image = "debian-cloud/debian-10"
#     }
#   } 
#   network_interface {
#     network = "default"
#   }
#   #network_interface {
#   #   network = var.vpcName
#   #   subnetwork = "subnet-01"
#   #}
#   metadata_startup_script = "metadata_startup_script = <<-EOT   #!/bin/bash   EOT"
#   allow_stopping_for_update = true
# }

# resource "google_compute_instance" "tf_instance_2" {
#   name = "tf-instance-2"
#   machine_type = "n1-standard-1"
#   zone = var.zone
#   boot_disk {
#     initialize_params {
#         image = "debian-cloud/debian-10"
#     }
#   } 
#   network_interface {
#     network = "default"
#   }
#   #network_interface {
#   #   network = var.vpcName
#   #   subnetwork = "subnet-02"
#   #}
#   metadata_startup_script = "metadata_startup_script = <<-EOT   #!/bin/bash   EOT"
#   allow_stopping_for_update = true
# }

#UNCOMENT TASK 4, FILL THE NAME!
# resource "google_compute_instance" "tf_instance_3" {
#   name = "FILLME"
#   machine_type = "n1-standard-2"
#   zone = var.zone
#   boot_disk {
#     initialize_params {
#         image = "debian-cloud/debian-10"
#     }
#   } 
#   network_interface {
#     network = "default"
#   }
#   metadata_startup_script = "metadata_startup_script = <<-EOT   #!/bin/bash   EOT"
#   allow_stopping_for_update = true
# }