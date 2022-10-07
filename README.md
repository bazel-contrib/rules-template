# Template for Bazel rules

Copy this template to create a Bazel ruleset.

Features:

- follows the official style guide at https://docs.bazel.build/versions/main/skylark/deploying.html
- includes Bazel formatting as a pre-commit hook (using [buildifier])
- includes stardoc API documentation generator
- includes typical toolchain setup
- CI configured with GitHub Actions
- Release on GitHub Actions when pushing a tag

See https://docs.bazel.build/versions/main/skylark/deploying.html#readme

[buildifier]: https://github.com/bazelbuild/buildtools/tree/master/buildifier#readme

Ready to get started? Copy this repo, then

1. ~~search for "dev_bivens_rules_dart" and replace with the name you'll use for your workspace~~
1. ~~search for "bivens-dev" and replace with GitHub org~~
1. ~~search for "dart" and replace with the language/tool your rules are for~~
1. rename directory "dart" similarly
1. run `pre-commit install` to get lints (see CONTRIBUTING.md)
1. if you don't need to fetch platform-dependent tools, then remove anything toolchain-related.
1. update the `actions/cache@v2` bazel cache key in [.github/workflows/ci.yaml](.github/workflows/ci.yaml) and [.github/workflows/release.yml](.github/workflows/release.yml) to be a hash of your source files.
1. (optional) install the [Renovate app](https://github.com/apps/renovate) to get auto-PRs to keep the dependencies up-to-date.
1. delete this section of the README (everything up to the SNIP).

---- SNIP ----

# Bazel rules for dart

## Installation

From the release you wish to use:
<https://github.com/bivens-dev/rules_dart/releases>
copy the WORKSPACE snippet into your `WORKSPACE` file.
