"DBEXT
"Adding connection profiles is the best way to use dbext, :h dbext.txt has lots of examples of different profiles for different databases.
"<leader>sbp - connect to a sql db
"<leader>slt - SQL List Table - lists all of the tables of the db
"<leader>sdt - SQL Describe Table - describes the table whose name is under your cursor
"<leader>se  - SQL Execute - executes the line your cursor is ON (command mode) or all selected text (visual mode)
"autocmd VimEnter * DBCompleteTables
"autocmd filetype sql :DBCompleteTables  "this causes result window not to display on .sql files
let g:dbext_default_profile_warehouse_local='type=PGSQL:host=localhost:port=5432:dbname=warehouse:user=postgres'
let g:dbext_default_profile_warehouse_prod='type=PGSQL:host=35.232.183.196:port=5432:dbname=warehouse:user=postgres'
let g:dbext_default_prompt_for_variables=0
let g:dbext_default_DBI_commit_on_disconnect = 0
"let g:dbext_default_window_use_horiz = 0  " Use vertical split
let g:dbext_default_window_width = 120
let g:dbext_default_window_increment = 50
