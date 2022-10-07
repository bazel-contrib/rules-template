import 'dart:io';

void main() {
  final filename = 'script_output.txt';
  File(filename).writeAsStringSync('Hello Bazel');
}
