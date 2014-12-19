class c_850_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_850_12;
    c_850_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z0x01x0xz010z01z011zzz0x10xzz1xzxzxxzxxzxzxxxzzzzxxzzxxxzxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
