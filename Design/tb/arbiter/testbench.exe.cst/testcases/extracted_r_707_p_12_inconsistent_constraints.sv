class c_707_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_707_12;
    c_707_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1z001xz0x00011x0x111z0x11x00z0xzxxzxzxxzzxxxxzzzxxzxzzxxxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
