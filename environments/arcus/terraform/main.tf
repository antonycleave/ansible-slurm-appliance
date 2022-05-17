variable "environment_root" {
    type = string
    description = "Path to environment root, automatically set by activate script"
}

variable "cluster_name" {
    type = string
    description = "Name for cluster, used as prefix for resources - set by environment var in CI"
}

variable "base_image_name" {
    type = string
    description = "Name of base image for all nodes - set by environment var in CI"
}

module "cluster" {
    source = "../../skeleton/{{cookiecutter.environment}}/terraform/"

    cluster_name = var.cluster_name
    cluster_net = "WCDC-iLab-60"
    cluster_subnet = "WCDC-iLab-60"
    vnic_type = "direct"
    key_pair = "slurm-app-ci"
    control_node = {
        flavor: "vm.alaska.cpu.general.small"
        image: var.base_image_name
    }
    login_nodes = {
        login-0: {
            flavor: "vm.alaska.cpu.general.small"
            image: var.base_image_name
        }
    }
    compute_types = {
        small: {
            flavor: "vm.alaska.cpu.general.small"
            image: var.base_image_name
        }
    }
    compute_nodes = {
        compute-0: "small"
        compute-1: "small"
    }
    
    environment_root = var.environment_root
}