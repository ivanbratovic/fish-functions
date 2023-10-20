function batstat --description "Prints battery status using acpi"
    if not which acpi >/dev/null;
        echo "Install acpi before running this function."
        return 1
    end
    set bat (acpi -b | cut -d' ' -f4-)
    echo "Battery: $bat"
end
