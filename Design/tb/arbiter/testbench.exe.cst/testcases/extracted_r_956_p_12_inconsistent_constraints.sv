class c_956_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_956_12;
    c_956_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x001zx00xzz011z1x1x0zxx01x000z0xzzxzxxzxxxxxxzzzxzzzxxzzxzxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
