<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Public API re-exports

<a id="dart_vm_binary"></a>

## dart_vm_binary

<pre>
dart_vm_binary(<a href="#dart_vm_binary-name">name</a>, <a href="#dart_vm_binary-deps">deps</a>, <a href="#dart_vm_binary-enable_asserts">enable_asserts</a>, <a href="#dart_vm_binary-main">main</a>)
</pre>

Invoke Dart to run the specified script.
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


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="dart_vm_binary-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="dart_vm_binary-deps"></a>deps |  Additional local files that will be imported.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional | [] |
| <a id="dart_vm_binary-enable_asserts"></a>enable_asserts |  Enable assert statements.   | Boolean | optional | False |
| <a id="dart_vm_binary-main"></a>main |  Main entrypoint script that is given to <code>dart run</code> command.   | <a href="https://bazel.build/concepts/labels">Label</a> | required |  |


