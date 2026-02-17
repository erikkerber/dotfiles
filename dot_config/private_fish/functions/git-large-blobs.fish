function git-large-blobs
    if test (count $argv) -eq 0
        set limit 10
    else
        set limit $argv[1]
    end

    git rev-list --objects --all \
    | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
    | sed -n 's/^blob //p' \
    | sort -n -k 2 \
    | tail -n$limit
end
