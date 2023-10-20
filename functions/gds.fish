function gds --wraps='git diff --staged' --description 'Alias for git diff --staged'
    git diff --staged $argv
end
