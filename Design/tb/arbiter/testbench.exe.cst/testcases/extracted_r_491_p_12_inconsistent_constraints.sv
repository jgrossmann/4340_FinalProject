class c_491_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_491_12;
    c_491_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x0100zz1xzz01zx0xx0zzzxzxx0x00zxzzzzzzzzzxxxxzzzxxxzzxzxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
