class c_199_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_199_12;
    c_199_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11x11101x0z1z1z11zz001001x00z1xxzxzxxzzzzzxzzxxzxxzzzzzxzxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
