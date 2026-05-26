function fish_user_key_bindings
    fish_vi_key_bindings
    functions -q fzf_configure_bindings; and fzf_configure_bindings \
        --directory=ctrl-t \
        --git_log=ctrl-o \
        --git_status=ctrl-g \
        --history=ctrl-r \
        --processes=ctrl-p \
        --variables=ctrl-v
    bind -M visual \t accept-autosuggestion
    #  bind -M insert \t accept-autosuggestion
end
