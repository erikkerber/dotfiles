function arm
    set entry $argv
    set side (mktemp -d)
    echo "$entry"
    echo "$side"
    mv "$entry" "$side"
    rm -r "$side" &
end
