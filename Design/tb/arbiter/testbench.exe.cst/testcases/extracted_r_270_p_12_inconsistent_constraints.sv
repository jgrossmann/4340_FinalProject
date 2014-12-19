class c_270_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_270_12;
    c_270_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1100z1111x1z0z01x01z11111100z1z0xzzzxzzxzxzxzzzxxxxzxzzxxzxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
