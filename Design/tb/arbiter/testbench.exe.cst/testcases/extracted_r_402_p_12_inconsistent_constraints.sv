class c_402_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_402_12;
    c_402_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxzzzzz0x10z0xx01z1110z1zz10zz0xxzzxzzxxzzzxxzxzzxxxzzzzxxxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
