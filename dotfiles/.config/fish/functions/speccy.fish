function speccy
    docker run \
        --rm \
        --workdir="$PWD" \
        -v "$PWD:$PWD" \
        jacobhayes/speccy $argv
end
