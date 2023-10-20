function clip --description "STDIN is saved to the system clipboard"
    if not which xclip >/dev/null;
        echo "Install xclip before running this function."
        return 1
    end
    set args
    for ARG in $argv;
        if [ $ARG = "--help" ]; or [ $ARG = "-h" ];
            echo "Saves text from file or STDIN to the system clipboard"
            return
        else if test (string match -re -- '^-.*' "$ARG")
            echo "Ignoring option $ARG" 1>&2
        else
            set args $args $ARG
        end
    end
    xclip -selection c $args
end
