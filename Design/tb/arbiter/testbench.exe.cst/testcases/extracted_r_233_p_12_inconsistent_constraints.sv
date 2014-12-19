class c_233_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_233_12;
    c_233_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx0x0z1zz11xzxz0xz0z110x1x0x11x0zxxzzzxzzzzxzxzxxxxzxzzzxzzxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
