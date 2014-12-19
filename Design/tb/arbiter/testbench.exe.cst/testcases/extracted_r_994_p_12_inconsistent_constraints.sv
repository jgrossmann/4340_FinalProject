class c_994_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_994_12;
    c_994_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx0z0xzxx1z0101xx00010001x0zx101xxzxxzxxzxxxxzzzxzzxzzzzxxxzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
