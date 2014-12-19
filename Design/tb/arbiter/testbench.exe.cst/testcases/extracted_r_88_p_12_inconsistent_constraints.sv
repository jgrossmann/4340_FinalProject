class c_88_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_88_12;
    c_88_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00z10xzx0z1xx01z0z1zzx0011z0x0zzzxxzxzzzxzxxzzzxxzxxzzxxxzxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
