workflow "Build Image" {
  on = "push"
  resolves = ["Push docker hub"]
}

action "Build Image and tag" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "docker build -t henriquegomes6/php56-apache ."
}

action "Push docker hub" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  needs = ["Build Image and tag"]
  runs = "docker push henriquegomes6/php56-apache"
}
