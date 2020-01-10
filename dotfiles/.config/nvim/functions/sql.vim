"Uppercase SQL
function! SQLtoUPPER()
    " can start lines
    execute ":%s/\\v([^A-z0-9]*)create(\\s+|$)/\\1CREATE\\2/g"
    execute ":%s/\\v([^A-z0-9]*)group by(\\s+|$)/\\1GROUP BY\\2/g"
    execute ":%s/\\v([^A-z0-9]*)where(\\s+|$)/\\1WHERE\\2/g"
    execute ":%s/\\v([^A-z0-9]*)select(\\s+|$)/\\1SELECT\\2/g"
    execute ":%s/\\v([^A-z0-9]*)inner(\\s+|$)/\\1INNER\\2/g"
    execute ":%s/\\v([^A-z0-9]*)join(\\s+|$)/\\1JOIN\\2/g"
    execute ":%s/\\v([^A-z0-9]*)from(\\s+|$)/\\1FROM\\2/g"
    execute ":%s/\\v([^A-z0-9]*)with(\\s+|$)/\\1WITH\\2/g"
    "found in the middle of a line
    execute ":%s/\\v([^A-z0-9]+)as(\\s+|$)/\\1AS\\2/g"
    execute ":%s/\\v([^A-z0-9]+)cross(\\s+|$)/\\1CROSS\\2/g"
    execute ":%s/\\v([^A-z0-9]+)coalesce(\\s+|$)/\\1COALESCE\\2/g"
    execute ":%s/\\v([^A-z0-9]+)nullif(\\s+|$)/\\1NULLIF\\2/g"
    execute ":%s/\\v([^A-z0-9]+)not(\\s+|$)/\\1NOT\\2/g"
    execute ":%s/\\v([^A-z0-9]+)on(\\s+|$)/\\1ON\\2/g"
endfunction
"todo change this to a sql-file-only command
nnoremap <leader>u :call SQLtoUPPER()<CR>
