function tag
  command tag $argv; and source /tmp/tag_aliases_$USER ^/dev/null
  alias ag "tag ag"
end
