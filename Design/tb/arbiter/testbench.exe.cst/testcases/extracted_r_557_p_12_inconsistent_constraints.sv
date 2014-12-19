class c_557_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_557_12;
    c_557_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x0xz11z1zx0zxxzz110xxxxzxz101x1xxzxxzzxzxxzzxzzxzzxxxzxzxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
