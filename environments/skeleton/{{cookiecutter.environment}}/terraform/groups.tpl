# Generated by cookiecutter terraform to provide a working example environment:

# Define groups for slurm partitions:
%{~ for type_name, type_descr in compute_types}
[${cluster_name}_${type_name}]
    %{~ for node_name, node_type in compute_nodes ~}
    %{~ if node_type == type_name }${cluster_name}-${node_name}%{ endif }
    %{~ endfor ~}
%{ endfor ~}

# Enable first login node as Open Ondemand server:
[openondemand]
${sort([for login in logins: login.name])[0]}

# Enable templated users to provide a demo user:
[basic_users:children]
cluster

# Enable slurm-controlled rebuild of compute nodes:
[rebuild:children]
control
compute
