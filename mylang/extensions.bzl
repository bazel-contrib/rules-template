"extensions for bzlmod"

load(":repositories.bzl", "mylang_register_toolchains")

mylang_toolchain = tag_class(attrs = {
    "name": attr.string(doc = "Base name for generated repositories"),
    "mylang_version": attr.string(doc = "Explicit version of mylang."),
})

def _toolchain_extension(module_ctx):
    registrations = {}
    for mod in module_ctx.modules:
        for toolchain in mod.tags.toolchain:
            if toolchain.name in registrations.keys():
                if toolchain.mylang_version == registrations[toolchain.name]:
                    # No problem to register a matching toolchain twice
                    continue
                fail("Multiple conflicting toolchains declared for name {} ({} and {}".format(
                    toolchain.name,
                    toolchain.mylang_version,
                    registrations[toolchain.name],
                ))
            else:
                registrations[toolchain.name] = toolchain.mylang_version
    for name, mylang_version in registrations.items():
        mylang_register_toolchains(
            name = name,
            mylang_version = mylang_version,
            register = False,
        )

mylang = module_extension(
    implementation = _toolchain_extension,
    tag_classes = {"toolchain": mylang_toolchain},
)
