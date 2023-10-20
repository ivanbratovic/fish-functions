function findhere --wraps 'find . -name' --description 'find by name in this dir'
    find . -name $argv; 
end
