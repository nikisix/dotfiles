function firebase-cli
    docker run \
        --rm \
        --workdir="$PWD" \
        -i \
        -p 9005:9005 \
        -v "$HOME/.config/configstore/:/root/.config/configstore/" \
        -v "$PWD:$PWD" \
        jacobhayes/firebase-cli $argv
end
