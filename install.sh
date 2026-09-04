#!/bin/bash
# One-line installer for amber: curl -fsSL https://raw.githubusercontent.com/
# jtrefon/homebrew-amber/main/install.sh | bash
#
# Installs Homebrew when missing, then installs amber from this tap. Because
# amber ships as a Homebrew formula, installs are exempt from Gatekeeper's
# quarantine check — no Apple Developer certificate or manual override needed.
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "==> Homebrew not found; installing it first..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

export HOMEBREW_NO_AUTO_UPDATE=1
echo "==> Installing amber..."
brew install jtrefon/homebrew-amber/amber

cat <<'EOF'

amber is installed. Get started:

  amber             terminal UI
  amber-cli -h      headless CLI help
EOF