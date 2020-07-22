#Gets a gitlab repo

data "gitlab_project" "client-repo" {
  id = var.config.repo_id
}


