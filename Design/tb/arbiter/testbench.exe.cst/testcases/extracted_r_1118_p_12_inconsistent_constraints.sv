class c_1118_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1118_12;
    c_1118_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1zzz00100x100zz0z0z11zz1z10xzz1zzxzxzzzzxzzxzzzxxzzxzzzzzxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
