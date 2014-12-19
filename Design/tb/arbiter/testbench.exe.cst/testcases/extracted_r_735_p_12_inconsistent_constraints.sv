class c_735_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_735_12;
    c_735_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx1x0zz1xxz10111xz0x01101x0x11z0xzxzzzxzzzzxzxxzxzxzxxzzzxxxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
