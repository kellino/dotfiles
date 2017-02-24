if exists('b:current_syntax')
    finish
endif

syntax keyword whileKeywd while do skip 
syntax keyword whileKeywd if then else
syntax keyword whileBool true false

syntax match whileOperator "\v\*"
syntax match whileOperator "\v\+"
syntax match whileOperator "\v-"
syntax match whileOperator "\v;"
syntax match whileOperator "\v\≡"
syntax match whileOperator "\v\:\="


syn match whileLineComment "#.*$"

highlight link whileKeywd Function
highlight link whileOperator Operator
highlight link whileLineComment Comment
highlight link whileBool Type

let b:current_syntax = 'while'
