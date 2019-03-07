workflow "Build Image" {
  on = "push"
  resolves = ["docker", "Build Image and tag"]
}

action "Build Image and tag" {
  uses = "actions/docker/cli@c08a5fc9e0286844156fefff2c141072048141f6"
  runs = "docker build -t henriquegomes6/php56-apache ."
}

action "Docker Registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Build Image and tag"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Docker Registry"]
  runs = "docker push henriquegomes6/php56-apache"
}