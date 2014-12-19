class c_1112_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1112_12;
    c_1112_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z1z0zzz0100x1x0x0xz1x0xzx00x011zxzzxxxzzzxxxzxzzzxxzxzxzzzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
