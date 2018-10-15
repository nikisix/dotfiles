function swagger2openapi
    docker run \
        --rm \
        --workdir="$PWD" \
        -v "$PWD:$PWD" \
        jacobhayes/swagger2openapi $argv
end
