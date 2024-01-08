function venv --wraps=source --description 'Alias for source venv/bin/activate.fish'
    # Find activations scripts in current dir
    set activation_script (find . -type f -wholename './*/bin/activate.fish' | grep -E --only-matching '^.(/[^/]+){3}$')
    if test -z "$activation_script"
        echo "Virtual environment not found in current directory."
        read -P "New virtual environment name (leave empty to abort): " venv_name 
        if test -z "$venv_name"
            echo "Aborted!"
            return 1
        end
        echo "Creating Python virtual environment '$venv_name'"
        python -m venv "$venv_name"
        set activation_script "./$venv_name/bin/activate.fish"
    end

    # Handle multiple virtual environments
    set num_venvs (echo $activation_script | wc -w)
    if test "$num_venvs" -ne 1
        echo "Multiple virtual environments found:"
        for idx in (seq 1 "$num_venvs")
            set venv_name (echo $activation_script[$idx] | cut -d'/' -f2)
            echo "$idx) $venv_name"
        end
        set chosen_idx "-1"
        while not test \( "$chosen_idx" -ge 1 \) -a \( "$chosen_idx" -le $num_venvs \)
            read -P "Which one to use (1-$num_venvs)? " chosen_idx
        end
        set activation_script $activation_script[$chosen_idx]
    end

    # Activate virtual environment
    set venv_name (echo $activation_script | cut -d'/' -f2)
    echo "Using virtual environment '$venv_name'"
    source $activation_script $argv
end
