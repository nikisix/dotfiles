# Using `--wraps hub` gives better GH completion, but it not as good for stock commands.
function g --wraps git
    hub $argv
end
