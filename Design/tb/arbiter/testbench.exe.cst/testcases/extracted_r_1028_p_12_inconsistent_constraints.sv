class c_1028_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1028_12;
    c_1028_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x01z0x0z0xx1xz1z1zxz01x10z011z0zzzzzxxxxzxzxxzzxzxxxzxxzzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
