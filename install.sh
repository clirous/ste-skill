#!/usr/bin/env bash
# Cài skill `ste` bằng symlink vào thư mục skill của Claude Code, Codex và chuẩn Agent Skills.
# Dùng symlink nên chỉ cần `git pull` trong repo là skill được cập nhật.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)/skills/ste"
TARGETS=("$HOME/.claude/skills" "$HOME/.codex/skills" "$HOME/.agents/skills")

if [ ! -f "$SRC/SKILL.md" ]; then
  echo "Không thấy $SRC/SKILL.md" >&2
  exit 1
fi

for dir in "${TARGETS[@]}"; do
  parent="$(dirname "$dir")"
  # Chỉ cài cho công cụ đã có trên máy (đã có ~/.claude, ~/.codex hoặc ~/.agents).
  if [ ! -d "$parent" ]; then
    echo "Bỏ qua $dir vì chưa có $parent"
    continue
  fi
  mkdir -p "$dir"
  dest="$dir/ste"
  if [ -L "$dest" ]; then
    ln -sfn "$SRC" "$dest"
    echo "Đã trỏ lại $dest -> $SRC"
  elif [ -e "$dest" ]; then
    echo "Bỏ qua $dest: đã có thư mục hoặc file thật, không ghi đè. Đổi tên hoặc xoá nó rồi chạy lại." >&2
  else
    ln -s "$SRC" "$dest"
    echo "Đã cài $dest -> $SRC"
  fi
done

echo "Xong. Mở phiên mới của Claude Code (gõ /ste) hoặc Codex (gõ \$ste)."
