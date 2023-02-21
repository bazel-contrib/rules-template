"extensions for bzlmod"

load(":repositories.bzl", "mylang_register_toolchains")

mylang_toolchain = tag_class(attrs = {
    "name": attr.string(doc = """\
Base name for generated repositories, allowing more than one mylang toolchain to be registered.
Only permitted in the root module.
"""),
    "mylang_version": attr.string(doc = "Explicit version of mylang.", mandatory = True),
})

def _toolchain_extension(module_ctx):
    registrations = {}
    for mod in module_ctx.modules:
        for toolchain in mod.tags.toolchain:
            if toolchain.name and not mod.is_root():
                fail("ERROR: Only the root module may provide a name for the mylang toolchain.")
            name = toolchain.name or "mylang"
            registrations[name] = registrations[name] or []
            registrations[name].append(toolchain.mylang_version)
    for name, versions in registrations.items():
        if len(versions) > 1:
            # TODO: should be semver-aware, using MVS
            selected = sorted(versions, reverse=True)[0]
            # buildifier: disable=print
            print("NOTE: mylang toolchain {} has multiple versions {}, selected {}".format(name, versions, selected))
        else:
            selected = versions[0]            

        mylang_register_toolchains(
            name = name,
            mylang_version = selected,
            register = False,
        )

mylang = module_extension(
    implementation = _toolchain_extension,
    tag_classes = {"toolchain": mylang_toolchain},
)
