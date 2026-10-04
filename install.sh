#!/usr/bin/env bash
# Install the `ste` skill as a symlink into the skill folders of Claude Code, Codex and the Agent Skills standard.
# Because it is a symlink, `git pull` in this repo is enough to update the skill.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)/skills/ste"
TARGETS=("$HOME/.claude/skills" "$HOME/.codex/skills" "$HOME/.agents/skills")

if [ ! -f "$SRC/SKILL.md" ]; then
  echo "Cannot find $SRC/SKILL.md" >&2
  exit 1
fi

for dir in "${TARGETS[@]}"; do
  parent="$(dirname "$dir")"
  # Only install for tools that are already on this machine (~/.claude, ~/.codex or ~/.agents exists).
  if [ ! -d "$parent" ]; then
    echo "Skipping $dir because $parent does not exist"
    continue
  fi
  mkdir -p "$dir"
  dest="$dir/ste"
  if [ -L "$dest" ]; then
    ln -sfn "$SRC" "$dest"
    echo "Re-linked $dest -> $SRC"
  elif [ -e "$dest" ]; then
    echo "Skipping $dest: a real folder or file is already there, not overwriting it. Rename or remove it, then run again." >&2
  else
    ln -s "$SRC" "$dest"
    echo "Installed $dest -> $SRC"
  fi
done

echo "Done. Start a new session of Claude Code (type /ste) or Codex (type \$ste)."
