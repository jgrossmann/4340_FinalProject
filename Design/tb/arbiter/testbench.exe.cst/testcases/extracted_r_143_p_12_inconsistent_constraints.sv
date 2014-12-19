class c_143_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_143_12;
    c_143_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11zxz01x0z01100z1x0zzx1100xz1z00zzxzxzzxzzxzzxxzxzzzxxzxxzxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
