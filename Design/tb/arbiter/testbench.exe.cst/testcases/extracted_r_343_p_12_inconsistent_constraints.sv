class c_343_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_343_12;
    c_343_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x0110xz0xz0z110zx10zzxxz1x0x00zxxzxxxzxxzxzxzzzxzzzxxzzzxxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
