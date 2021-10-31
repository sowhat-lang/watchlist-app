resource "digitalocean_app" "watchlist-app" {
  spec {
    name   = "watchlist-app"
    region = "nyc1"

    service {
      name               = "app"
      environment_slug   = "node-js"
      instance_count     = 1
      instance_size_slug = "professional-xs"

      git {
        repo_clone_url = "https://github.com/digitalocean/sample-nodejs.git"
        branch         = "main"
      }
    }

    database {
      name       = "notes"
      engine     = "PG"
      production = false
    }
  }
}