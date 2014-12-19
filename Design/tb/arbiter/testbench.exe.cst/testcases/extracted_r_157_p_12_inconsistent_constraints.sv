class c_157_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_157_12;
    c_157_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzzx10xz011xzx0z11x0z0zzzz0z10zzxxxxxxxzzzzzxzxxzzzxzxxzzzzzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
