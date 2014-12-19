class c_1034_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_1034_12;
    c_1034_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0xx0z000z11x00zz0x0000zzxx0zxx1xxzxzzxxxzxxzxzxxzxzzxzzxxzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
