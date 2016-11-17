#!/usr/bin/env bash
#
# tbjers/dot-keybase ellipsis package

pkg.install() {
  mkdir -p $HOME/.atom
  case $(os.platform) in
    linux)
      if utils.cmd_exists dnf; then
        sudo dnf install -y https://prerelease.keybase.io/keybase_amd64.rpm
        run_keybase
      fi
      if utils.cmd_exists yaourt; then
        yaourt -Sy --noconfirm keybase-bin
      fi
      ;;
  esac
}

pkg.pull() {
  git pull
  apm upgrade --no-confirm --no-color
}
