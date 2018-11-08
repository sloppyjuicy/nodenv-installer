# nodenv installer & doctor scripts

## nodenv-installer

The `nodenv-installer` script idempotently installs or updates nodenv on your
system. If Homebrew is detected, installation will proceed using `brew
install/upgrade`. Otherwise, nodenv is installed under `~/.nodenv`.

Additionally, [node-build](https://github.com/nodenv/node-build#readme) is also
installed if `nodenv install` is not already available.

```sh
# with curl
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-installer | bash

# alternatively, with wget
wget -q https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-installer -O- | bash
```

## nodenv-doctor

After the installation, a separate `nodenv-doctor` script is run to verify the
success of the installation and to detect common issues. You can run
`nodenv-doctor` on your machine separately to verify the state of your install:

```sh
# with curl
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash

# alternatively, with wget
wget -q https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor -O- | bash
```

## Credits

Forked from [Mislav Marohnić][mislav]'s [rbenv-installer][] and modified for node.

[mislav]: https://github.com/mislav
[rbenv-installer]: https://github.com/rbenv/rbenv-installer
