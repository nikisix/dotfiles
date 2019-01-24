"Uppercase SQL
function! SQLtoUPPER()
    execute ":%s/\\v(\\s+)create(\\s+)/\\1CREATE\\2/g"
    execute ":%s/\\v(\\s+)not(\\s+)/\\1NOT\\2/g"
    execute ":%s/\\v(\\s+)on(\\s+)/\\1ON\\2/g"
    execute ":%s/\\v(\\s+)as(\\s+)/\\1AS\\2/g"
    execute ":%s/\\v(\\s*)where(\\s+)/\\1WHERE\\2/g"
    execute ":%s/\\v(\\s*)select(\\s+)/\\1SELECT\\2/g"
    execute ":%s/\\v(\\s*)inner(\\s+)/\\1INNER\\2/g"
    execute ":%s/\\v(\\s*)join(\\s+)/\\1JOIN\\2/g"
    execute ":%s/\\v(\\s*)from(\\s+)/\\1FROM\\2/g"
    execute ":%s/\\v(\\s*)cross(\\s+)/\\1CROSS\\2/g"
    execute ":%s/\\v(\\s*)with(\\s+)/\\1WITH\\2/g"
    execute ":%s/\\v(\\s*)coalesce(\\s+)/\\1COALESCE\\2/g"
    execute ":%s/\\v(\\s*)nullif(\\s+)/\\1NULLIF\\2/g"
endfunction
"todo change this to a sql-file-only command
nnoremap <leader>u :call SQLtoUPPER()<CR>
