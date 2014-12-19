class c_535_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_535_12;
    c_535_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzx0x000zxz1z1x11zzxx0xzz1z11zz1xzxzxzzzxxxxzzzzzxxzzxzxzxzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
