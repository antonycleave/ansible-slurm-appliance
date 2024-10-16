cluster_name = "r94test"
cluster_net = "perftest"
cluster_subnet = "perftest"
key_pair = "slurm-deploy-key" # *
control_node_flavor = "g.2.standard"
login_nodes = {
    login-0: "g.2.standard"
}
state_volume_size = 20
home_volume_size = 20
cluster_domain_suffix = "internal"
cluster_image_id = "64b3be13-8dd2-4684-b8a3-534d7f03f024"
compute = {
    general = {
        nodes: ["compute-0", "compute-1"]
        flavor: "g.2.standard"
    }
}