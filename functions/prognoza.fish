function prognoza --description "Show weather prognosis in in Croatian for a given sity."
    set city (echo $argv[1] | sed 's/^\([a-z]\)/\u&/')
    curl -s "wttr.in/$city?q1F&lang=hr"
    if [ $city = "Zagreb" ];
        curl -s "https://meteo.hr/prognoze.php?section=prognoze_metp&param=zgdanas" | grep "fd-l-col--12 fd-l-md-col--8 fd-u-display--block" --after-context 5 | cut -f4 | cut -d ">" -f2 | egrep [[:alnum:]]+ | fold -sw 125
    end
end
