"[[ COLOR ]]
"hi CSVColumnEven ctermbg=4 guibg=Grey
hi CSVColumnEven ctermbg=0 guibg=Grey
"for dark terminals
hi CSVColumnOdd  ctermbg=0 guibg=DarkBlue
"for light terminals
"hi CSVColumnOdd  term=bold ctermbg=Cyan guibg=Cyan
"
"[[ LEFT ALIGN COLUMNS ]]
let b:csv_arrange_align = 'l*'
let g:csv_arrange_align = 'l*'
"hover over raw csv column to algn, and then:
":ArrangeColumn
