workflow "Build Image" {
  on = "push"
  resolves = ["Create image"]
}

action "Create image" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  args = "docker build -t henriquegomes6/php56-apache"
}
