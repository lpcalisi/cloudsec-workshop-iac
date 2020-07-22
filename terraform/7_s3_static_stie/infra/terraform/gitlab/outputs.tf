output "repo_url" {
  value = data.gitlab_project.client-repo.ssh_url_to_repo
}

output "repo_path" {
value = data.gitlab_project.client-repo.path
}

output "repo_name" {
value = data.gitlab_project.client-repo.namespace_id
}
