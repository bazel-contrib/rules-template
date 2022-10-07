"implementation details for dart_vm_binary"

def _dart_binary_impl(ctx):
    is_windows = ctx.target_platform_has_constraint(ctx.attr._windows_constraint[platform_common.ConstraintValueInfo])

    if is_windows:
        script_extension = ".bat"
        leftover_args = "%*"
        export_cmd = "set"
    else:
        script_extension = ".sh"
        leftover_args = "$@"
        export_cmd = "export"

    # Declare output file for launcher script on selected platform
    outfile_name = ctx.attr.name + script_extension
    outfile = ctx.actions.declare_file(outfile_name)

    # Get Dart executable and build flags to include in launcher
    dart = ctx.toolchains["@dev_bivens_rules_dart//dart:toolchain_type"]
    flags = _build_dart_flags(enable_asserts = ctx.attr.enable_asserts)
    runtime_args = leftover_args

    # Set DART_DIR within build bin
    dart_executable = dart.dartinfo.tool_files[0].short_path
    dart_cache = dart_executable + "_cache"

    ctx.actions.write(
        output = outfile,
        content = """
        {export_cmd} DART_DIR="{dart_cache}"
        {dart_executable} run {flags} {main_file} {runtime_args}
        """.format(
            export_cmd = export_cmd,
            dart_cache = dart_cache,
            dart_executable = dart.dartinfo.tool_files[0].short_path,
            main_file = ctx.file.main.path,
            flags = flags,
            runtime_args = runtime_args,
        ),
        is_executable = True,
    )
    runfiles = ctx.runfiles(files = dart.dartinfo.tool_files +
                                    ctx.files.main +
                                    ctx.files.deps)
    return DefaultInfo(
        executable = outfile,
        runfiles = runfiles,
    )

dart_vm_binary = rule(
    implementation = _dart_binary_impl,
    executable = True,
    toolchains = ["@dev_bivens_rules_dart//dart:toolchain_type"],
    attrs = {
        "main": attr.label(
            allow_single_file = True,
            mandatory = True,
            doc = "Main entrypoint script that is given to `dart run` command.",
        ),
        "deps": attr.label_list(
            default = [],
            allow_files = True,
            doc = "Additional local files that will be imported.",
        ),
        "enable_asserts": attr.bool(
            default = False,
            doc = "Enable assert statements.",
        ),
        "_windows_constraint": attr.label(
            default = "@platforms//os:windows",
        ),
    },
    doc = """Invoke Dart to run the specified script.
For Dart documentation, see https://dart.dev.
Example:
```starlark
load("@dev_bivens_rules_dart//dart:defs.bzl", "dart_vm_binary")
dart_vm_binary(
  name = "example",
  main = "main.dart",
  enable_asserts = True,
  deps = [
      "helper.dart",
      ":dart_utils",
  ],
)
```
""",
)

def _build_dart_flags(enable_asserts):
    flags = []
    if enable_asserts:
        flags.append("--enable_asserts")
    return " ".join(flags)
