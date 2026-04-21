if test -z "$SHELL" -o "$SHELL" != (command -v fish)
    set -gx SHELL (command -v fish)
end
