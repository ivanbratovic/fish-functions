function heil --description "Prints both head and tail of file"
    if test (count $argv) -lt 2; or test (count $argv) -gt 2
        echo -e "Usage: \e[1mheil\e[0m \e[4mtop\e[0m \e[4mbottom\e[0m"
        return
    end
    set outfile (mktemp || tempfile || echo "/tmp/tmp.heil")
    cat > $outfile

    if test (math $argv[1] + $argv[2]) -ge (wc -l $outfile | cut -d" " -f 1);
        cat $outfile
    else
        head -n $argv[1] $outfile
        tail -n $argv[2] $outfile
    end

    rm $outfile
end
