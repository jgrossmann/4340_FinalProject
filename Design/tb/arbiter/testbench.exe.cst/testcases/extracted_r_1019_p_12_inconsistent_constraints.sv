class c_1019_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1019_12;
    c_1019_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10001100xxzxxxxzx011x0x00xx1z1x0zzzzxxzxzxzzxxzzzxxzzxxzzzzxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
