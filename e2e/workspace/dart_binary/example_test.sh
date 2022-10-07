#!/usr/bin/env bash
set -e

$SCRIPT_LOCATION script_output.txt

echo "Dart execution finished"

expected_output='Hello Bazel'
actual_output="$(cat script_output.txt)"

if [[ "$expected_output" != "$actual_output" ]]; then
  echo "------------------------------------------"
  echo "ERROR: Unexpected output from Deno script."
  printf "Expected:\n%s\n" "$expected_output" >&2
  printf "Actual:\n%s\n" "$actual_output" >&2
  exit 1
else
  echo "SUCCESS: Output file matched expected output."
fi