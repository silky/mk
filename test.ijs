load'~Projects/mk/microkanren.ijs'

test_var_bnat =: 3 : 'assert.0&=var<2'
test_var_bbool =: 3 : 'assert.0&=var<1'
test_var_bnull =: 3 : 'assert.0&=var<'''''
test_var_nat =: 3 : 'assert.var 2'
test_var_bool =: 3 : 'assert.var 1'
test_var_null =: 3 : 'assert.0&=var'''''
test_var_char =: 3 : 'assert.0&=var''a'''
test_var_bchar =: 3 : 'assert.0&=var<''a'''

test_find_nat_empty =: 3 : 'assert.(2)&-:2 find (0;'''';'''')'
test_find_nat_nat =: 3 : 'assert.(1)&-:2 find (0;(<2);<<1)'
test_find_nat_char =: 3 : 'assert.(''a'')&-:2 find (0;(<2);<<''a'')'
test_find_nat_null =: 3 : 'assert.('''')&-:2 find (0;(<2);<<'''')'
test_find_bnat_walk =: 3 : 'assert.(4)&-:2 find (0;(2;3);<3;4)'
test_find_bnat_stackerr =: 3 : 'assert.(2)&-:2 find (0;(<2);<<2)'

test_substintree=:3 :'assert.((<9),(<<<8),<(<6 5),<<<''a'';'''')&-:(0;(<3);<<''a'') (4 :''(x find~]) L:0 y'') (9;(<<8);<6 5;<<<3;'''')'
test_flattensubst=:3 :'assert.(9;8;6 5;''a'';'''')&-:(0;(<3);<<''a'') (4 :''(<S:0) (x find~]) L:0 y'') (9;(<<8);<6 5;<<<3;'''')'

test_occurs_scalar=:3 :'assert.0&=(0) occurs (0) (0;'''';'''')'
test_occurs_null=:3 :'assert.0&=(<'''') occurs (<'''') (0;'''';'''')'
test_occurs_var=:3 :'assert.0&=(<0) occurs (<0) (0;'''';'''')'
test_occurs_multivar=:3 :'assert.0&=(0;1;4) occurs (0;1;4) (0;'''';'''')'
test_occurs_yes =: 3 :'assert.(<0) occurs (<<0)  (0;'''';'''')'
test_occurs_no =: 3 :'assert.0&=(<0) occurs (<1)  (0;'''';'''')'
test_occurs_all=:3 :'assert.(0;1;4) occurs ((<0);(<1);<<4) (0;'''';'''')'
test_occurs_some=:3 :'assert.(0;1;4) occurs (0;1;<<4) (0;'''';'''')'
test_occurs_none=:3 :'assert.0&=(0;1;4) occurs (0;1;<4) (0;'''';'''')'
test_occurs_findyes =: 3 :'assert.0&=(<0) occurs (<1)  (0;(<1);<<0)'
test_occurs_findyes2 =: 3 :'assert.(<0) occurs (<<1)  (0;(<1);<<0)'
test_occurs_findno =: 3 :'assert.0&=(<0) occurs (<<1) (0;(<1);<<2)'

test_exts_bnat =: 3 :'assert.(0;(3;2);<4;1)&-:(<2) exts (<1) (0;(<3);<<4)'
test_exts_multiple =: 3 :'assert.(0;(3;6;7);<4;8;9)&-:(6;7) exts (8;9) (0;(<3);<<4)'
test_exts_multidimension =: 3 :'assert.((<0),(<9;10;11;12;13;14;15;16;17),<00;01;2;3;4;5;6;7;8)&-:(3 3$;/9&+i.9) exts (3 3$;/i.9) (0;'''';'''')'
test_exts_empty =: 3 :'assert.(0;(,<2);<,<1)&-:(<2) exts (<1) (0;'''';'''')'
test_exts_occurs=:3 :'assert.0&=(<0)exts(<<0)(0;'''';'''')'
test_exts_occurs_find=:3 :'assert.0&=(<0)exts(<<1)(0;(<1);<<0)'

NB.test_unify_null_null =: 3 : 'assert.0&='''' unify '''' (0;'''';'''')'
NB.test_unify_bnull_bnull =: 3 : 'assert.(0;'''';'''')&-:(<'''')unify(<'''')(0;'''';'''')'
NB.test_unify_null_var =: 3 : 'assert.0&= '''' unify (<3) (0;'''';'''')'
NB.test_unify_bnat_bnat =: 3 : 'assert.(0;(,<4);<,<3)&-:(<4) unify (<3) (0;'''';'''')'
NB.test_unify_unequal_shape=:3 :'assert.0&=(<4) unify (3;2) (0;'''';'''')'
NB.test_unify_crisscross =: 3 : 'assert. (0;(0;1);<(''b'';''a''))&-:(''a'';0) unify (1;''b'') (0;'''';'''')'