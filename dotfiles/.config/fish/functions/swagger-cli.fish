function swagger-cli
    docker run \
        --rm \
        --workdir="$PWD" \
        -v "$PWD:$PWD" \
        jacobhayes/swagger-cli $argv
end
