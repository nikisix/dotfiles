function _iterm2_hook
  # This function should be used as the iterm2 command to run on terminal open
  #
  # Set iterm title bar to black
  _dark_titlebar
  # Create a new tmux session if it doesn't exists. Otherwise, create a new grouped session and clean it up on exit.
  # This allows multiple terminals to view different tmux windows.
  tmux new -s base; or \
   tmux new -t base \
    | awk '{ gsub(")]", "", $4); print $4 }' \
    | xargs --no-run-if-empty tmux kill-session -t
end
