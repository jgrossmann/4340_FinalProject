class c_682_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_682_12;
    c_682_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11xx0xz11z01xx0x0z0xzz10x0x0101zxzzzxzxzzxxzzzxxzzzzxzxxzzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
