function octave
    docker run \
        --rm \
        -it \
        -v="$PWD:/host" \
        --workdir=/host \
        jacobhayes/octave $argv
end
