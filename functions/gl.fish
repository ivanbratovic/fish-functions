function gl --wraps='git log --oneline -n 20' --wraps='git log --pretty=oneline -n 30' --description 'Alias for git log --pretty=oneline -n 30'
    git log --pretty=oneline -n 20 $argv        
end
