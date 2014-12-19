class c_1123_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1123_12;
    c_1123_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0010xzz0x0zz0xz0xz1z10010xzx1z0xxxxzxzzzxxzxzxzzzxzxxzzxzxxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
