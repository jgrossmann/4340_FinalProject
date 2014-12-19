class c_210_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_210_12;
    c_210_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz1x1x01zxx01000z00z0001xzx1xx0zzxzxzzzxzxzxzzxxzxxzzxzzxzxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
