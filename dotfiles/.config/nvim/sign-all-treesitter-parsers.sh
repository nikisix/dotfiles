#!/bin/bash

#⏺ The treesitter parsers in site/parser/ are unsigned (no codesign output), while the orgmode parser is properly signed. macOS is killing nvim when it tries to dlopen
#  an unsigned .so.
#
#  The fix is to ad-hoc sign them all:
#
#  codesign --force --sign - /Users/six/.local/share/nvim/site/parser/*.so
#
#  This will ad-hoc sign every treesitter parser. After that, nvim should start normally. Want me to run it?
#
#✻ Cogitated for 58s
#
#❯ That fixed it!!! You're a genious
#
#⏺ Glad it's working! For future reference: whenever you update treesitter parsers (TSUpdate), the newly compiled .so files may be unsigned again. If nvim suddenly dies
#  after a parser update, just re-run that codesign command.

codesign --force --sign - /Users/six/.local/share/nvim/site/parser/*.so

