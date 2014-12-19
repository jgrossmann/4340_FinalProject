class c_952_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_952_12;
    c_952_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z01z1zxx0xx0zz1xz11xxzz001x0xxxxzxzzxxxzzxzxxxxzxzzzxzzzxzxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
