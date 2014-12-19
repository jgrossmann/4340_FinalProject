class c_593_12;
    integer y_pos = 2060830875;
    rand bit[7:0] n_arb_address_i; // rand_mode = ON 

    constraint c_this    // (constraint_mode = ON) (arbiter_transaction.sv:27)
    {
       ((n_arb_address_i[3:0]) >= y_pos);
    }
endclass

program p_593_12;
    c_593_12 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zxx1xzzzz00zx0x1110x0z11zxz0xx1xxzxzzzzzzzzzxzzxzzxzxzzxzxzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
