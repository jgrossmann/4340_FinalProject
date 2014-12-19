class c_148_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_148_12;
    c_148_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xx00zz11z0z0zzz0z1zz0z1z1xzzz10xxxzxzxzxxzzxzzzzxxzzzxzzxxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
