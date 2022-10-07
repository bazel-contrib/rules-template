load("@dev_bivens_rules_dart//dart:defs.bzl", "dart_binary")
load("@bazel_skylib//rules:build_test.bzl", "build_test")

dart_binary(
    name = "example_binary",
    main = "example.dart",
)

build_test(
    name = "smoke_test",
    targets = [
        # targets you add above
        ":example_binary",
    ],
)

sh_test(
    name = "example_test",
    srcs = ["example_test.sh"],
    data = [":example_binary"],
    env = {
        "SCRIPT_LOCATION": "$(location :example_binary)",
    },
)
