class c_468_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_468_12;
    c_468_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z01001x101z1x11x1z1z0x0x10xxz1z0xxxxzxzzxxzxzzxzxxxzzxxxxzzxzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
