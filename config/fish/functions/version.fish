function version
    git show $argv:Apps/Flagship/BUILD.bazel | grep 'MARKETING_VERSION =' | awk -F '"' '{print $2}'
end
