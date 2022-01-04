function checkout-pr
  git fetch origin pull/$argv/merge:$argv
  git checkout $argv
end

