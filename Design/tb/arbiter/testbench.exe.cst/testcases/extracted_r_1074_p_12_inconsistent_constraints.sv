class c_1074_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1074_12;
    c_1074_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0z000xxzz0zz100z1x0001xz0x0zxz0xxxxzzxxzzzxxxzxzxxzzzzzzzxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
