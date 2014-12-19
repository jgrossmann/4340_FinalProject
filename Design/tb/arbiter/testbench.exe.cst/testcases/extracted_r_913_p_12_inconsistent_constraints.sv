class c_913_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_913_12;
    c_913_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz01x01110z10x1x01xz0x1x1xzx10x0xxzxzzzxzxzzxxzxzzzzzzxzxxxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
