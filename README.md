# trigger-circleci-workflow-action
Triggers a CircleCI workflow from Github actions.

## How to enable for your repository

Add a file in your repo called `.github/main.workflow`

Insert this into that file
```
workflow "on pull request open, trigger circleci workflow" {
  on = "pull_request"
  resolves = ["trigger-circleci-workflow"]
}

action "trigger-circleci-workflow" {
  uses = "paulness/trigger-circleci-workflow-action@master"
  secrets = ["CIRCLE_TOKEN"]
}
```

Add your `CIRCLE_TOKEN` secret on the secrets settings page for you repository e.g.
`https://github.com/<YOUR USERNAME/ORG>/<YOUR REPO>/settings/secrets`
