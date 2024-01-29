function git-large-blobs
    set limit $argv[1]
    if not set -q limit
        set limit 10
    end

    git rev-list --objects --all \
    | git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' \
    | sed -n 's/^blob //p' \
    | sort -n -k 2 \
    | tail -n$limit
end
