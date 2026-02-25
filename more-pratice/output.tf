output "zone_name" {
    value = var.availability_zones
}

output "total_instance" {
    value = var.instance_count
}

output "first_zone" {
    value = var.availability_zones[0]
}

output "env_tag" {
    value =  var.tags["env"]
}