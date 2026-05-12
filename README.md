# setup-hostess

Install the latest Hostess CLI in GitHub Actions.

## Usage

```yaml
name: Deploy

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: howl-cloud/setup-hostess@v1

      - run: hostess validate

      - run: hostess deploy --env production --no-interactive
        env:
          HOSTESS_TOKEN: ${{ secrets.HOSTESS_TOKEN }}
```

## Authentication

For deploys, create a `HOSTESS_TOKEN` repository secret and pass it to the `hostess deploy` step:

```yaml
- run: hostess deploy --env production --no-interactive
  env:
    HOSTESS_TOKEN: ${{ secrets.HOSTESS_TOKEN }}
```

## What This Action Does

This action runs the official Hostess installer:

```sh
curl -fsSL https://hostess.sh/install.sh | sh
```

Then it ensures the installed `hostess` binary is available on `PATH` for later workflow steps.
