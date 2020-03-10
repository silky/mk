load'~Projects/mk/microkanren.ijs'

test_var_bnat =: 3 : 'assert.0&=var<2'
test_var_bbool =: 3 : 'assert.0&=var<1'
test_var_bnull =: 3 : 'assert.0&=var<'''''
test_var_nat =: 3 : 'assert.var 2'
test_var_bool =: 3 : 'assert.0&=var 1'
test_var_null =: 3 : 'assert.0&=var'''''
test_var_char =: 3 : 'assert.0&=var''a'''
test_var_bchar =: 3 : 'assert.0&=var<''a'''
test_var_vecint=:3 :'assert.0&= var i.2'
test_var_vecbox=:3 :'assert.0&=var ;/ i.2'

test_find_natempty =: 3 : 'assert. 2&-:(2;'''') find 2'
test_find_natself =: 3 : 'assert. ''''&-:(2;2;'''') find 2'
test_find_nullempty =: 3 : 'assert. ''''&-:(2;'''') find '''''
test_find_nullnat =: 3 : 'assert. ''''&-:(2;2) find '''''
test_find_walk =: 3 : 'assert. 4&-:(2;2 3;3;4) find 2'
test_find_walk_char =: 3 : 'assert. ''a''&-:(2;2 3;3;''a'') find 2'

test_occurs_self=:3 :'assert.(<2;2) occurs (2;'''')'
test_occurs_yes_simple=:3 :'assert. (<2;<<2) occurs (2;'''')'
test_occurs_no=:3 :'assert.0&= (<2;3) occurs (2;'''')'
test_occurs_no_simple=:3 :'assert.0&= (<2;<<3) occurs (2;'''')'
test_occurs_yes_walk=:3 :'assert. (<2;<<3) occurs (2;3;2)'
test_occurs_no_walk=:3 :'assert.0&= (<2;<<3) occurs (2;3;4)'
test_occurs_tree_no=:3 :'assert.0&= (<2;<(3;4;5)) occurs (2;'''')'
test_occurs_tree_yes=:3 :'assert.(<2;<(2;3;4)) occurs (2;'''')'
test_occurs_nested=:3 :'assert.(<2;<(3;(<<(4;2));4)) occurs (2;'''')'
test_occurs_nested_walk=:3 :'assert.(<2;<(3;(<<(4;3));4)) occurs (2;3;2)'

test_exts_empty=:3 :'assert.(2;(,2);3)&-:(<2;3) exts (2;'''')'
test_exts_append=:3 :'assert.(2;2 4;3;5)&-:(<4;5) exts (2;2;3)'
test_exts_equal=:3 :'assert. (2;'''')&-: (<2;2) exts (2;'''')'
test_exts_occurs=:3 :'assert. 0&-: (<2;<<2) exts (2;'''')'

test_unify_null_null =: 3 : 'assert.(2;'''')&='''' unify '''' (2;'''')'
test_unify_bnull_bnull =: 3 : 'assert.(2;'''')&-:(<'''')unify(<'''') (2;'''')'
test_unify_null_nat =: 3 : 'assert.(4 3 2;(,3);'''')&-: '''' unify 3 (4 3 2;'''')'
test_unify_nat_nat =: 3 : 'assert.(5 4 3 2;(,4);3)&-:4 unify 3 (5 4 3 2;'''')'
test_unify_bnat_bnat =: 3 : 'assert.(5 4 3 2;(,4);3)&-:(<4) unify (<3) (5 4 3 2;'''')'
test_unify_unequal_shape=:3 :'assert.0&=(<4) unify (3;2) (5 4 3 2;'''')'
test_unify_occurs=:3 : 'assert.(3 2;'''')&-:2 unify 2 (3 2;'''')'
test_unify_occurs_walk=:3 : 'assert.0&=2 unify (<3) (2;3;2)'
test_unify_occurs_nested=:3 : 'assert.0&=2 unify (<<<2) (2;'''')'
test_unify_crisscross =: 3 : 'assert. (4 3 2;2 3;''b'';''a'')&-:(''a'';2) unify (3;''b'') (4 3 2;'''')'
test_unify_nested =: 3 : 'assert.(4 3 2;2 3;''d'';''c'')&-:(''a'';<<(''c'';2)) unify (''b'';<<(3;''d'')) (4 3 2;'''')'
test_unify_walk =: 3 : 'assert.(2;2 3;3;1)&-:2 unify 3 (2;2 3;3;1)'
test_unify_walk_add =: 3 : 'assert.(2;2 3 2;4;''a'';3)&-:2 unify 3 (2;2 3;4;''a'')'