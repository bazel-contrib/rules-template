# Declare the local Bazel workspace.
workspace(
    # If your ruleset is "official"
    # (i.e. is in the bazelbuild GitHub org)
    # then this should just be named "rules_mylang"
    # see https://docs.bazel.build/versions/main/skylark/deploying.html#workspace
    name = "com_myorg_rules_mylang",
)

load(":internal_deps.bzl", "rules_mylang_internal_deps")

# Fetch deps needed only locally for development
rules_mylang_internal_deps()

load("//mylang:repositories.bzl", "mylang_register_toolchains", "rules_mylang_dependencies")

# Fetch dependencies which users need as well
rules_mylang_dependencies()

mylang_register_toolchains(
    name = "mylang1_14",
    mylang_version = "1.14.2",
)

# For running our own unit tests
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

############################################
# Gazelle, for generating bzl_library targets
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.19.3")

gazelle_dependencies()
