class c_319_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_319_12;
    c_319_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz0z0x1x11z1x001zxz101110x1x01x0xzxxzzzzzzzxzxzxxxxxxzzzzzxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
