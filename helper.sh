read -p "Input zone: " zone
# instanceId1=$(gcloud compute instances describe tf-instance-1 --zone us-east1-b --format="json(id)" | jq -r .id)
# instanceId2=$(gcloud compute instances describe tf-instance-2 --zone us-east1-b --format="json(id)" | jq -r .id)
instanceId1=$(gcloud compute instances describe tf-instance-1 --zone $zone --format="json(id)" | jq -r .id)
instanceId2=$(gcloud compute instances describe tf-instance-2 --zone $zone --format="json(id)" | jq -r .id)
terraform import module.instances.google_compute_instance.tf_instance_1 $instanceId1
terraform import module.instances.google_compute_instance.tf_instance_2 $instanceId2