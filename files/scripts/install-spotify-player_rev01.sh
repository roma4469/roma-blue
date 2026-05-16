#!/usr/bin/env bash
set -euo pipefail

TMPDIR="$(mktemp -d)"
cd "$TMPDIR"

curl -L -o spotify_player.tar.gz \
  "https://github.com/aome510/spotify-player/releases/latest/download/spotify_player-x86_64-unknown-linux-gnu.tar.gz"

tar -xzf spotify_player.tar.gz

install -Dm755 spotify_player /usr/bin/spotify_player.real

cat > /usr/bin/spotify_player <<'EOF'
#!/usr/bin/env bash
export ALSA_PLUGIN_DIR=/usr/lib64/alsa-lib
exec /usr/bin/spotify_player.real "$@"
EOF

chmod +x /usr/bin/spotify_player

rm -rf "$TMPDIR"
