#!/usr/bin/env bash
#
# tbjers/dot-keybase ellipsis package

pkg.install() {
  mkdir -p $HOME/.atom
  case $(os.platform) in
    osx)
      if utils.cmd_exists brew; then
        brew cask install keybase
      fi
      ;;
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
}
