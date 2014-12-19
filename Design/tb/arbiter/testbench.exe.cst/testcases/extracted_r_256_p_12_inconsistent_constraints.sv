class c_256_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_256_12;
    c_256_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x10xx0x0z1xx1x10z1x0x00z11zzz1z1xzxxzzzxzxzxzxxzxzzzxxxxzxzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
