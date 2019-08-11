#!/usr/bin/env bats

load test_helper

@test "reports bin in PATH - missing" {
  run nodenv-doctor

  assert_failure
  assert_line "Checking for \`nodenv' in PATH: not found"
  assert_line "  Please refer to https://github.com/nodenv/nodenv#installation"
}

@test "reports bin in PATH - missing, despite ~/.nodenv" {
  with_nodenv_in_home

  run nodenv-doctor

  assert_failure
  assert_line "Checking for \`nodenv' in PATH: not found"
  assert_line "  You seem to have nodenv installed in \`$HOME/.nodenv/bin', but that"
}

@test "reports bin in PATH - OK" {
  with_nodenv

  run nodenv-doctor

  assert_line "Checking for \`nodenv' in PATH: $PWD/node_modules/.bin/nodenv"
}

@test "reports bin in PATH - multiple" {
  with_nodenv
  with_nodenv_in_home
  PATH="$HOME/.nodenv/bin:$PATH"

  run nodenv-doctor

  assert_line "Checking for \`nodenv' in PATH: multiple"
}

@test "reports shims in PATH - missing" {
  with_nodenv

  run nodenv-doctor

  assert_line "Checking for nodenv shims in PATH: not found"
}

@test "reports shims in PATH - OK" {
  with_nodenv
  with_nodenv_root

  run nodenv-doctor

  assert_line "Checking for nodenv shims in PATH: OK"
}
