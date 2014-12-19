class c_943_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_943_12;
    c_943_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1000z000z1x00xx01xzxz0x01x00z0z0xzxzzzxxzxxzzxxzxzzxxzzxxzxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
