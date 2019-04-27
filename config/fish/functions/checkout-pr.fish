function checkout-pr
  git fetch upstream pull/$argv/merge:$argv
  git checkout $argv
end

