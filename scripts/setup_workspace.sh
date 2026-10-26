#!/usr/bin/env bash
# Run only after switching to agent007. This script creates the workspace and
# starter files; it does not perform the administrator-only account creation
# or ownership-change step.
set -euo pipefail

if [[ "$(id -un)" != "agent007" ]]; then
  echo "Error: run this script as agent007, not root or another user." >&2
  exit 1
fi

mkdir -p "$HOME/mission/intel" "$HOME/mission/ops/backup"
touch "$HOME/mission/intel/targets.txt" \
      "$HOME/mission/intel/routes.txt" \
      "$HOME/mission/intel/keys.txt"

cd "$HOME/mission/intel"
ls > listing1.txt
ls -l > listing2.txt
ls -la > listing3.txt

cp "$HOME/mission/intel/routes.txt" "$HOME/mission/ops/backup/"
rm "$HOME/mission/intel/keys.txt"
chmod 640 "$HOME/mission/intel/targets.txt"

echo "Workspace prepared. Review the README for recovery and ownership steps."
echo "Current user: $(id -un)"
ls -laR "$HOME/mission"
