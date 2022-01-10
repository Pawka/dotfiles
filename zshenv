DEBIAN_PREVENT_KEYBOARD_CHANGES=yes

readonly CARGO_ENV= "$HOME/.cargo/env"
if [[ -f "$CARGO_ENV" ]]; then
    . "$CARGO_ENV"
fi
