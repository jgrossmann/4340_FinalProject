class c_434_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_434_12;
    c_434_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01000100000x0zxx0x00xx1x01z0x1z1zzxxxzxzzzxxzzzxxxzxxzxxzxxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
