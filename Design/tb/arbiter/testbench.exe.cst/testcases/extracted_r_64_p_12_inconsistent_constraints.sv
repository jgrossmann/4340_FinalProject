class c_64_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_64_12;
    c_64_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1z1xxz1z01x1x0zzz11x0z1zxx0xzz0xzzzzxzzxxxzxxzxzxzzxxzxzxxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
