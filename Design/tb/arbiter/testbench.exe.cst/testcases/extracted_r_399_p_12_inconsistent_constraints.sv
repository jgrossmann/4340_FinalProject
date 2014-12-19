class c_399_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_399_12;
    c_399_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01z0zzx00x11x10011x1x0x0xx01x1xxxxxxxzxzzxzzzzzxxxzzzzzxzzxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
