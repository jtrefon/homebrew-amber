# homebrew-amber

Homebrew tap for [amber](https://github.com/jtrefon/amber), the C++ AI agent
harness with a headless CLI (`amber-cli`) and an ncurses terminal UI
(`amber`).

## Install

The one-line, no-typing install (installs Homebrew first if you don't have it):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jtrefon/homebrew-amber/main/install.sh)"
```

Or the classic two-step:

```sh
brew tap jtrefon/homebrew-amber
brew install jtrefon/homebrew-amber/amber-agent
```

The fully-qualified form also works without a separate `brew tap`:

```sh
brew install jtrefon/homebrew-amber/amber-agent
```

## Requirements

- macOS 13+ on Apple Silicon (arm64)
- [Homebrew](https://brew.sh) (the one-line installer handles this for you)

## No Gatekeeper dance

amber is distributed as a Homebrew *formula*, so installs are exempt from
macOS's Gatekeeper quarantine check — no Apple Developer certificate, no
right-click-to-open workaround, no "unidentified developer" warning. The
`amber`, `amber-cli`, and `amber-bench` binaries just work after install.

## Updating

```sh
brew upgrade jtrefon/homebrew-amber/amber-agent
```

Note: a different, unrelated project called `amber` (a Crystal web
framework) ships in homebrew-core, so always use the fully-qualified name
above — never a bare `brew install amber`.

Releases are tag-driven from the main repository; a GitHub Action in this tap
wires the formula to each new release automatically.

## Upgrading from the old formula name

Releases before 0.4.1 used the tap formula name `amber`. Because that name
collides with an unrelated project in homebrew-core, the formula was renamed
to `amber-agent`; `brew upgrade` cannot follow the rename, so if you installed
the old name, migrate it once:

```sh
brew uninstall jtrefon/homebrew-amber/amber
brew install jtrefon/homebrew-amber/amber-agent
```

## What you get

- `amber` — ncurses terminal UI
- `amber-cli` — headless agent CLI
- `amber-bench` — benchmark/KPI harness
- Static libraries + headers (`libagent_core.a`, `libagent_tools.a`,
  `include/agent/...`) for embedding

## Source

The formula is generated from the main repository's [release
assets](https://github.com/jtrefon/amber/releases).

## License

Apache-2.0. See [LICENSE](LICENSE).