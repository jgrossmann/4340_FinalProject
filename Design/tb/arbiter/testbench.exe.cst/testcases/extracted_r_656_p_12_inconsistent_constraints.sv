class c_656_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_656_12;
    c_656_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xxz01z0xz1zx1xz0z0z1z0xz1x1z00zzxxzxzxzzzxzzxxxxxxzzxzzzzxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
