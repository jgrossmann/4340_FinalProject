class c_895_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_895_12;
    c_895_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx10x11z1x000zz1000x11000xxzz01xzzxzxxzzzzxxzxxxzxxxxzzxzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
