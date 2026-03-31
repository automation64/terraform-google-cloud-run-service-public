#
# HashiCorp Random
#

resource "random_integer" "main" {
  min = 1
  max = 9999
}

#
# Google Service Account
#

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}
