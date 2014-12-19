class c_336_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_336_12;
    c_336_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1011x0xx000xz0011z0z0zx10zz0x0x0zxzzxzxzxxzzxxxzzzzzxzxzxzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
