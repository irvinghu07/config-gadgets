if type -q fzf
    fzf --fish | source
end

if type -q fnm
    fnm env --use-on-cd --shell fish | source
end
