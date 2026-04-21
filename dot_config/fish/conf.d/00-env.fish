set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx DEFAULT_USER ethan

if test -f $HOME/.cargo/env.fish
    source $HOME/.cargo/env.fish
end

set -gx BUN_INSTALL $HOME/.bun
