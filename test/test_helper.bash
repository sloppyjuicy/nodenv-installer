load ../node_modules/bats-support/load
load ../node_modules/bats-assert/load

# guard against executing this block twice due to bats internals
if [ -z "$TEST_DIR" ]; then
  TEST_DIR="${BATS_TMPDIR}/nodenv"
  TEST_DIR="$(mktemp -d "${TEST_DIR}.XXX" 2>/dev/null || echo "$TEST_DIR")"
  export TEST_DIR

  for nodenv_var in $(env 2>/dev/null | grep '^NODENV_' | cut -d= -f1); do
    unset "$nodenv_var"
  done
  unset nodenv_var

  export HOME="${TEST_DIR}/home"
  export NODENV_ROOT="${TEST_DIR}/root"
  PATH=/usr/bin:/bin:/usr/sbin:/sbin
  PATH="${BATS_TEST_DIRNAME}/../bin:$PATH"
  export PATH
fi

with_nodenv_in_home() {
  local nodenv="$PWD/node_modules/.bin/nodenv"

  mkdir -p "$HOME/.nodenv/bin"
  cd "$HOME/.nodenv/bin" || return
  ln -sf "$nodenv" nodenv
}

with_nodenv() {
  PATH="$PWD/node_modules/.bin:$PATH"
}

with_nodenv_root() {
  local shims_path="$NODENV_ROOT/shims"
  mkdir -p "$shims_path"
  PATH="$shims_path:$PATH"
}
