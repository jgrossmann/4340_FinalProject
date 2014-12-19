class c_73_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_73_12;
    c_73_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx1z01z10x1x01z0x1zzx0z10010zz1zxzxxzzzxxzzxzzxzzxxzzzzxxxxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
