class c_531_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_531_12;
    c_531_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10zxx0z1x01xz01x1z11z1x1zxz0z0zxxxxxxxzzzzzxxzxzzxxzxzxzxzzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
